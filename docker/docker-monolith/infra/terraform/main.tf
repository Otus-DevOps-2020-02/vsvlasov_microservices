terraform {
  required_version = "~>0.12"
}

provider "google" {
  version = "~>2.5.0"

  project = var.project
  region  = var.region
}


resource "google_compute_instance" "app" {
  name         = "docker-host-${count.index}"
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["docker-host"]
  count        = var.instance_count
  boot_disk {
    initialize_params {
      image = var.app_disk_image
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}


resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-host"]
}
