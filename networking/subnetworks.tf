resource "google_compute_subnetwork" "bastion" {
  name = var.bastion_name
  ip_cidr_range = var.bastion_network_cidr
  region = var.bastion_region
  network = google_compute_network.network.name

  depends_on = [
    google_compute_network.network]
}

resource "google_compute_subnetwork" "ipa" {
  name = var.ipa_name
  ip_cidr_range = var.ipa_network_cidr
  region = var.ipa_region
  network = google_compute_network.network.name

  depends_on = [
    google_compute_network.network]
}

resource "google_compute_subnetwork" "vpn" {
  name = var.vpn_name
  ip_cidr_range = var.vpn_network_cidr
  region = var.vpn_region
  network = google_compute_network.network.name

  depends_on = [
    google_compute_network.network]
}