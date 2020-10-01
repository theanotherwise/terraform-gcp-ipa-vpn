resource "google_compute_address" "bastion" {
  name = var.bastion_name
}

resource "google_compute_address" "ipa" {
  name = "${var.ipa_name}${count.index}"
  count = var.ipa_count
}

resource "google_compute_address" "vpn" {
  name = "${var.vpn_name}${count.index}"
  count = var.vpn_count
}