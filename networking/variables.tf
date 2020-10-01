variable "random" {
  type = string
}

variable "network" {
  type = string
}

########################
# IPA

variable "ipa_name" {
  type = string
}

variable "ipa_count" {
  type = string
}

variable "ipa_region" {
  type = string
}

variable "ipa_zone" {
  type = string
}

variable "ipa_network_cidr" {
  type = string
}

########################
# VPN

variable "vpn_name" {
  type = string
}

variable "vpn_count" {
  type = string
}

variable "vpn_region" {
  type = string
}

variable "vpn_zone" {
  type = string
}

variable "vpn_network_cidr" {
  type = string
}

########################
# Bastion

variable "bastion_name" {
  type = string
}

variable "bastion_region" {
  type = string
}

variable "bastion_zone" {
  type = string
}

variable "bastion_network_cidr" {
  type = string
}