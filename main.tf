provider "google" {
  credentials = ".credentials.json"
  project = "molten-infusion-277321"
  region = var.region
}

terraform {
  backend "local" {
    path = ".states/terraform.tfstate"
  }
}

resource "google_compute_project_metadata" "metadata" {
  metadata = {
    ssh-keys = var.terraform_ssh_key_pub
  }
}

resource "random_string" "random" {
  length = 8
  special = false
  upper = false
}