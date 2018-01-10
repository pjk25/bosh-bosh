variable "env_id" {
  type = "string"
}

provider "google" {}

resource "google_compute_network" "bbl-network" {}
