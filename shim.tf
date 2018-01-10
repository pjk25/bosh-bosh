variable "env_id" {
  type = "string"
}

provider "google" {}

resource "google_compute_network" "bbl-network" {
  name = "${var.env_id}-network"
}
