locals {
  random = "${var.prefix}${random_string.random.result}"

  network = "${local.random}-${var.network}"

  ipa_name = "${local.random}-${var.ipa_name}"
  vpn_name = "${local.random}-${var.vpn_name}"
  bastion_name = "${local.random}-${var.bastion_name}"
}