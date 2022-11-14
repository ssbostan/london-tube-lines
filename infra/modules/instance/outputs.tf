output "public_ip" {
  value = aws_instance.london_tube_lines_admin_instance.public_ip
}

output "public_dns" {
  value = aws_instance.london_tube_lines_admin_instance.public_dns
}
