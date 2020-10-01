resource "google_compute_instance" "ipa" {
  name = "${var.ipa_name}${count.index}"
  machine_type = var.ipa_machine_type

  count = var.ipa_count

  zone = var.ipa_zone

  tags = var.ipa_tags

  boot_disk {
    initialize_params {
      image = var.ipa_image
    }
  }
  network_interface {
    subnetwork = var.provider_subnetwork_name
  }

  allow_stopping_for_update = true

  depends_on = [
    var.dependencies]
}