variable "ipa_image" {
  type = string
}

variable "ipa_name" {
  type = string
}

variable "ipa_count" {
  type = number
}

variable "ipa_tags" {
  type = list(string)
}

variable "ipa_zone" {
  type = string
}

variable "ipa_network_cidr" {
  type = string
}

variable "ipa_machine_type" {
  type = string
}

variable "provider_subnetwork_name" {
  type = string
}

variable "dependencies" {
  type = list(string)
}
