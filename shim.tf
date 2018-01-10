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

provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_network" "bbl-network" {}
