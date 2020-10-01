project_id = "molten-infusion-277321"

region = "us-central1"

prefix = "a"

##################
# General

terraform_user = "terraform"
terraform_ssh_key_pub = <<EndOfMessage
terraform:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDzBN74p3jEDTcupqIeD/MFZRAbPnELmSnJGbqbpknpKXpiCrnqqOdqnR+snoCDnhHzRV84Xk+BNvbhLRgxR7Lz2xCTeyzYbntJgupClDq0fPBUBaWTyZep2wEfPOx9Nj3z7fY0WVhmYgF264upIskIZ2YF0ewwhhGpwirFRe0PCRr0tXFY/qQ50xBh0NCtK0Kg2txph6cjZ+t6r0+42GA6eQxfSL/TP/j3PTXlygnLFQ/8jD9SaVAKdEeuB45WVEUa+V8vGc4GOqehdgnaivS5XhxDjL+aK3TeBSiECg5a+Qgeq+QKReQbauZLTDmRd/poVXdcNpNZsVeUWYSP/ntmAEcMM74rUKYUCE/NT1n+SHSgCG58thRqYFbHTJGdigLcocf57uCNoWAjzYvo8Xrhl7s3ACFtpggC0DMlkpWMH2IOiZca+7TXa2i+fvNoRJyPSujuND5wfvN6zxu6VKvHu0v+QIA6RWBdAj/bDUjxvq/uKNizWCru4G2RpTwuXuE=
EndOfMessage

##################
# Network

network = "network"

##################
# IPA

ipa_name = "ipa"
ipa_count = 1
ipa_tags = [
  "ipa"]
ipa_region = "us-central1"
ipa_zone = "us-central1-a"
ipa_machine_type = "n1-standard-8"
ipa_image = "ubuntu-os-cloud/ubuntu-1804-lts"
ipa_network_cidr = "10.0.11.0/24"

##################
# VPN

vpn_name = "vpn"
vpn_count = 1
vpn_tags = [
  "vpn"]
vpn_region = "us-central1"
vpn_zone = "us-central1-a"
vpn_machine_type = "n1-standard-8"
vpn_image = "ubuntu-os-cloud/ubuntu-1804-lts"
vpn_network_cidr = "10.0.10.0/24"

##################
# Bastion

bastion_name = "bastion"
bastion_tags = [
  "bastion"]
bastion_region = "us-central1"
bastion_zone = "us-central1-a"
bastion_machine_type = "n1-standard-1"
bastion_image = "ubuntu-os-cloud/ubuntu-1804-lts"
bastion_network_cidr = "10.0.1.0/24"
