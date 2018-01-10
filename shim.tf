variable "project_id" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "env_id" {
  type = "string"
}

variable "credentials" {
  type = "string"
}

provider "google" {}

resource "google_compute_network" "bbl-network" {}
