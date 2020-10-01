output "network_name" {
  value = google_compute_network.network.name
}

output "network_id" {
  value = google_compute_network.network.id
}

output "subnetwork_bastion_name" {
  value = google_compute_subnetwork.bastion.name
}

output "address_bastion_address" {
  value = google_compute_address.bastion.address
}

output "subnetwork_ipa_name" {
  value = google_compute_subnetwork.ipa.name
}

output "subnetwork_vpn_name" {
  value = google_compute_subnetwork.vpn.name
}

output "address_vpn_address" {
  value = google_compute_address.vpn.*.address
}