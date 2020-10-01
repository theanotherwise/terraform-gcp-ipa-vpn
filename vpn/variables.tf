variable "vpn_image" {
  type = string
}

variable "vpn_name" {
  type = string
}

variable "vpn_count" {
  type = number
}

variable "vpn_tags" {
  type = list(string)
}

variable "vpn_zone" {
  type = string
}

variable "vpn_network_cidr" {
  type = string
}

variable "vpn_machine_type" {
  type = string
}

variable "provider_subnetwork_name" {
  type = string
}

variable "provider_address" {
  type = list(string)
}

variable "dependencies" {
  type = list(string)
}
