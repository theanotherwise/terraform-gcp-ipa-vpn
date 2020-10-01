module "ipa" {
  source = "./ipa"

  ipa_image  = var.ipa_image
  ipa_name = local.ipa_name
  ipa_count = var.ipa_count
  ipa_tags = var.ipa_tags
  ipa_zone = var.ipa_zone
  ipa_machine_type = var.ipa_machine_type
  ipa_network_cidr = var.ipa_network_cidr

  provider_subnetwork_name = module.networking.subnetwork_ipa_name

  dependencies = [
    "module.networking"]
}