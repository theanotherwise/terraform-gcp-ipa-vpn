rm -f /etc/openvpn/server.key
rm -f /etc/openvpn/server.crt
rm -f /etc/openvpn/dh.pem
rm -f /etc/openvpn/ta.key
rm -f /etc/openvpn/ca.crt
rm -f /etc/openvpn/clients/*
rm -f /etc/openvpn/server.conf

cd ~/
rm -rf ~/easyrsa

mkdir -p /etc/openvpn/clients

EASYRSA_VERSION="3.0.8"
wget "https://github.com/OpenVPN/easy-rsa/releases/download/v${EASYRSA_VERSION}/EasyRSA-${EASYRSA_VERSION}.tgz" -O easyrsa.tgz
mkdir -p ~/easyrsa/ca
mkdir -p ~/easyrsa/server 
mkdir -p ~/easyrsa/clients
tar -xvf easyrsa.tgz --strip-components=1 -C ~/easyrsa/ca
tar -xvf easyrsa.tgz --strip-components=1 -C ~/easyrsa/server
tar -xvf easyrsa.tgz --strip-components=1 -C ~/easyrsa/clients 

cd ~/easyrsa/ca
cp vars.example vars
export EASYRSA_REQ_CN="Seems Cloud Root CA"
./easyrsa --batch init-pki
./easyrsa --batch build-ca nopass

export EASYRSA_REQ_CN="vpn1.seems.cloud"
cd ~/easyrsa/server
./easyrsa --batch init-pki
./easyrsa --batch gen-req server nopass

cd ~/easyrsa/ca/
./easyrsa --batch import-req ~/easyrsa/server/pki/reqs/server.req server
./easyrsa --batch sign-req server server

cd ~/easyrsa/server
./easyrsa --batch gen-dh
openvpn --genkey --secret ta.key

for i in `seq 2 10` ; do
    export EASYRSA_REQ_CN="client$i.seems.cloud"
    cd ~/easyrsa/clients
    ./easyrsa --batch init-pki
    ./easyrsa --batch gen-req client$i nopass
    cp ~/easyrsa/clients/pki/private/client$i.key /etc/openvpn/clients/
    
    cd ~/easyrsa/ca/
    ./easyrsa --batch import-req ~/easyrsa/clients/pki/reqs/client$i.req client$i
    ./easyrsa --batch sign-req client client$i
    cp ~/easyrsa/ca/pki/issued/client$i.crt /etc/openvpn/clients/
done

cp ~/easyrsa/ca/pki/ca.crt /etc/openvpn
cp ~/easyrsa/server/pki/private/server.key /etc/openvpn
cp ~/easyrsa/ca/pki/issued/server.crt /etc/openvpn
cp ~/easyrsa/server/pki/dh.pem /etc/openvpn
cp ~/easyrsa/server/ta.key /etc/openvpn

cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/
gzip -d /etc/openvpn/server.conf.gz

echo "auth SHA256" >> /etc/openvpn/server.conf
echo "dh dh.pem" >> /etc/openvpn/server.conf

sed "s/^;user nobody$/user nobody/g" -i /etc/openvpn/server.conf
sed "s/^;group nogroup$/group nogroup/g" -i /etc/openvpn/server.conf

sed "s/;push \"redirect-gateway def1 bypass\-dhcp\"/push \"redirect\-gateway def1 bypass-dhcp\"/g" -i /etc/openvpn/server.conf

echo "push \"dhcp-option DNS 8.8.8.8\"" >> /etc/openvpn/server.conf
echo "push \"dhcp-option DNS 8.8.4.4\"" >> /etc/openvpn/server.conf

sed "s/^port 1194$/port 1194/g" -i /etc/openvpn/server.conf
sed "s/^proto udp$/;proto udp/g" -i /etc/openvpn/server.conf
sed "s/^;proto tcp$/proto tcp/g" -i /etc/openvpn/server.conf

echo "cert server.crt" >> /etc/openvpn/server.conf
echo "key server.key" >> /etc/openvpn/server.conf