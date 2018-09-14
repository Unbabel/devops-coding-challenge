variable "region" {
  description = "Region where the instance will be created"
}

variable "region_zone" {
  description = "Datacenter where in the region the instance will be created"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
}

variable "account_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
}

variable "ssh_user" {
  description = "User for access to vm"
}

variable "ssh_pub_key" {
  description = "Path to ssh pub key file"
}

variable "network" {
  description = "The network where the subnet and instances will be created"
}

variable "gitlab-static" {
  description = "The static network interface"
}
