resource "google_compute_firewall" "from-bastion-to-all" {
  name = "${var.random}-from-bastion-to-cluster"
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

resource "google_compute_firewall" "from-internet-to-bastion" {
  name = "${var.random}-from-internet-to-bastion"
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

resource "google_compute_firewall" "from-internet-to-vpn" {
  name = "${var.random}-from-internet-to-vpn"
  network = google_compute_network.network.name

  direction = "INGRESS"

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "vpn"]

  allow {
    protocol = "tcp"
    ports = [
      "1194"]
  }

  allow {
    protocol = "udp"
    ports = [
      "1194"]
  }

  depends_on = [
    google_compute_network.network]
}