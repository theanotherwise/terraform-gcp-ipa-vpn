rm -f /etc/openvpn/server.key
rm -f /etc/openvpn/server.crt
rm -f /etc/openvpn/dh.pem
rm -f /etc/openvpn/ta.key
rm -f /etc/openvpn/ca.crt

cd ~/
rm -rf ~/easyrsa

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

export EASYRSA_REQ_CN="client1.seems.cloud"
cd ~/easyrsa/clients
./easyrsa --batch init-pki
./easyrsa --batch gen-req client1 nopass

cd ~/easyrsa/ca/
./easyrsa --batch import-req ~/easyrsa/clients/pki/reqs/client1.req client1
./easyrsa --batch sign-req clients client1

cp ~/easyrsa/ca/pki/ca.crt /etc/openvpn
cp ~/easyrsa/server/pki/private/server.key /etc/openvpn
cp ~/easyrsa/ca/pki/issued/server.crt /etc/openvpn
cp ~/easyrsa/server/pki/dh.pem /etc/openvpn
cp ~/easyrsa/server/ta.key /etc/openvpn