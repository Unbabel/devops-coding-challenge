# Sets the default provider GCP
provider "google" {
  credentials = "${file(var.account_file_path)}"
  project     = "${var.project_name}"
  region      = "${var.region}"
}

# Creates a custom subnet
resource "google_compute_subnetwork" "unbabel-subnet-gitlab" {
  name          = "unbabel-subnet-gitlab"
  ip_cidr_range = "10.10.10.0/24"
  network       = "${var.network}"
  region        = "${var.region}"
}

# Security Grups to alow ssh
resource "google_compute_firewall" "unbabel-firewall-rule" {
  name    = "unbabel-firewall"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["87.103.126.74/32", "10.10.0.0/16", "35.240.70.79/32", "104.155.35.102/32", "109.49.231.127/32"]
}

# Creates computes disk
#resource "google_compute_disk" "unbabel_gitlab_disk" {
#  name  = "gitlab-disk"
#  type  = "pd-ssd"
#  zone  = "${var.region_zone}"
#  size  = "10"
#}

# Creates the instance
resource "google_compute_instance" "unbabel_gitlab_instance" {
  count        = 1
  name         = "gitlab-server"
  machine_type = "n1-standard-1"
  zone         = "${var.region_zone}"
  tags         = ["unbabel", "gitlab-server"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20180815"
    }
  }

  #  attached_disk {
  #     source = "${google_compute_disk.unbabel_gitlab_disk.name}" 
  #  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.unbabel-subnet-gitlab.name}"

    access_config {
      nat_ip = "${var.gitlab-static}"
    }
  }
  metadata {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }
}

# Creates the runner instance
resource "google_compute_instance" "unbabel_gitlab_runner" {
  count        = 1
  name         = "gitlab-runner"
  machine_type = "n1-standard-1"
  zone         = "${var.region_zone}"
  tags         = ["unbabel", "gitlab-runner"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20180815"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.unbabel-subnet-gitlab.name}"

    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }

  metadata {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }
}
