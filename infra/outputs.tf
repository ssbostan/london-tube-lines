output "admin_instance_public_ip" {
  value = module.london_tube_lines_admin_instance.public_ip
}

output "admin_instance_public_dns" {
  value = module.london_tube_lines_admin_instance.public_dns
}
