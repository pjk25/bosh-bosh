variable "env_id" {
  type = "string"
}

provider "google" {}

resource "google_compute_network" "bbl-network" {
  name                    = "${var.env_id}-network"
  auto_create_subnetworks = false
  prevent_destroy         = true
}
