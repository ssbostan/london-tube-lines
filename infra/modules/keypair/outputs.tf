output "public_key" {
  value = tls_private_key.london_tube_lines_tls_private_key.public_key_openssh
}

output "key_name" {
  value = aws_key_pair.london_tube_lines_key_pair.key_name
}
