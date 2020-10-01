variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "prefix" {
  type = string
}

######################
# General

variable "terraform_user" {
  type = string
}

variable "terraform_ssh_key_pub" {
  type = string
}

######################
# Network

variable "network" {
  type = string
}

########################
# IPA

variable "ipa_name" {
  type = string
}

variable "ipa_count" {
  type = number
}

variable "ipa_tags" {
  type = list(string)
}

variable "ipa_region" {
  type = string
}

variable "ipa_zone" {
  type = string
}

variable "ipa_image" {
  type = string
}

variable "ipa_network_cidr" {
  type = string
}

variable "ipa_machine_type" {
  type = string
}

########################
# VPN

variable "vpn_name" {
  type = string
}

variable "vpn_count" {
  type = number
}

variable "vpn_tags" {
  type = list(string)
}

variable "vpn_region" {
  type = string
}

variable "vpn_zone" {
  type = string
}

variable "vpn_image" {
  type = string
}

variable "vpn_network_cidr" {
  type = string
}

variable "vpn_machine_type" {
  type = string
}

########################
# Bastion

variable "bastion_name" {
  type = string
}

variable "bastion_tags" {
  type = list(string)
}

variable "bastion_region" {
  type = string
}

variable "bastion_zone" {
  type = string
}

variable "bastion_image" {
  type = string
}

variable "bastion_network_cidr" {
  type = string
}

variable "bastion_machine_type" {
  type = string
}
