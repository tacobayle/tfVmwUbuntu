output "ubuntu_static_ips" {
  value = var.dhcp == false ? var.ubuntu_ip4_addresses.* : null
}

output "ubuntu_dhcp_ips" {
  value = var.dhcp == true ? vsphere_virtual_machine.ubuntu_dhcp.*.default_ip_address : null
}

output "ubuntu_username" {
  value = var.ubuntu.username
}

output "ubuntu_password" {
  value = var.ubuntu_password == null ? random_string.ubuntu_password.result : var.ubuntu_password
}

output "ssh_private_key_path" {
  value = "~/.ssh/${var.ssh_key.private_key_name}.pem"
}