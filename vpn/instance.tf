resource "google_compute_instance" "vpn" {
  name = "${var.vpn_name}${count.index}"
  machine_type = var.vpn_machine_type

  count = var.vpn_count

  zone = var.vpn_zone

  tags = var.vpn_tags

  boot_disk {
    initialize_params {
      image = var.vpn_image
    }
  }
  network_interface {
    subnetwork = var.provider_subnetwork_name

    access_config {
      nat_ip = element(var.provider_address, count.index)
    }
  }

  allow_stopping_for_update = true

  depends_on = [
    var.dependencies]
}