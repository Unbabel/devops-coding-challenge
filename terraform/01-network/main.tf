# Sets the default provider GCP
provider "google" {
  credentials = "${file(var.account_file_path)}"
  project     = "${var.project_name}"
  region      = "${var.region}"
}

# Creates a custom network, similar to VPC on AWS
resource "google_compute_network" "unbabel-network" {
  name                    = "unbabel-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_address" "gitlab-static" {
  name = "gitlab-static"
}
