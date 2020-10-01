module "networking" {
  source = "./networking"

  random = local.random

  network = local.network

  ipa_name = local.ipa_name
  ipa_count = var.ipa_count
  ipa_region = var.ipa_region
  ipa_zone = var.ipa_zone
  ipa_network_cidr = var.ipa_network_cidr

  vpn_name = local.vpn_name
  vpn_count = var.vpn_count
  vpn_region = var.vpn_region
  vpn_zone = var.vpn_zone
  vpn_network_cidr = var.vpn_network_cidr

  bastion_name = local.bastion_name
  bastion_region = var.bastion_region
  bastion_zone = var.bastion_zone
  bastion_network_cidr = var.bastion_network_cidr
}
