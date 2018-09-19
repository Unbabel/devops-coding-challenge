output "Instance gitlab Names" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_instance.*.name)}"
}

output "Instance gitlab Public IPs" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_instance.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "Instance gitlab Private IPs" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_instance.*.network_interface.0.address)}"
}

output "Instance runner Name" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_runner.*.name)}"
}

output "Instance runner Public IPs" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_runner.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "Instance runner Private IPs" {
  value = "${join(" ", google_compute_instance.unbabel_gitlab_runner.*.network_interface.0.address)}"
}
