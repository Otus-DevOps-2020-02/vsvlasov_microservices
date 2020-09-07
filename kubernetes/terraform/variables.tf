variable project {
  description = "Project ID"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable node_disk_size {
  description = "Node disk size"
  default     = "20"
}

variable "machine_type" {
  description = "Machine type"
}
