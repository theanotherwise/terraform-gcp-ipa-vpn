module "vpn" {
  source = "./vpn"

  vpn_image = var.vpn_image
  vpn_name = local.vpn_name
  vpn_count = var.vpn_count
  vpn_tags = var.vpn_tags
  vpn_zone = var.vpn_zone
  vpn_machine_type = var.vpn_machine_type
  vpn_network_cidr = var.vpn_network_cidr

  provider_address = module.networking.address_vpn_address
  provider_subnetwork_name = module.networking.subnetwork_vpn_name

  dependencies = [
    "module.networking"]
}