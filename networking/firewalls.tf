resource "google_compute_firewall" "from-bastion-to-all-ssh" {
  name = "${var.random}-from-bastion-to-all-ssh"
  network = google_compute_network.network.name

  direction = "INGRESS"

  source_tags = [
    "bastion"]
  target_tags = [
    "all"]

  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }

  depends_on = [
    google_compute_network.network]
}

resource "google_compute_firewall" "from-internet-to-bastion-ssh" {
  name = "${var.random}-from-internet-to-bastion-ssh"
  network = google_compute_network.network.name

  direction = "INGRESS"

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "bastion"]

  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }

  depends_on = [
    google_compute_network.network]
}

resource "google_compute_firewall" "from-internet-to-vpn-ssh" {
  name = "${var.random}-from-internet-to-vpn-ssh"
  network = google_compute_network.network.name

  direction = "INGRESS"

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "vpn"]

  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }

  depends_on = [
    google_compute_network.network]
}

resource "google_compute_firewall" "from-internet-to-vpn-openvpn" {
  name = "${var.random}-from-internet-to-vpn-openvpn"
  network = google_compute_network.network.name

  direction = "INGRESS"

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "vpn"]

  allow {
    protocol = "udp"
    ports = [
      "1194"]
  }

  depends_on = [
    google_compute_network.network]
}