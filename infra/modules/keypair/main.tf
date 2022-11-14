resource "tls_private_key" "london_tube_lines_tls_private_key" {
  algorithm = "ED25519"
}

resource "local_file" "london_tube_lines_public_openssh_key" {
  filename        = var.ssh_public_key_filename
  content         = tls_private_key.london_tube_lines_tls_private_key.public_key_openssh
  file_permission = "0644"
}

resource "local_file" "london_tube_lines_private_openssh_key" {
  filename        = var.ssh_private_key_filename
  content         = tls_private_key.london_tube_lines_tls_private_key.private_key_openssh
  file_permission = "0600"
}

resource "aws_key_pair" "london_tube_lines_key_pair" {
  key_name   = "london-tube-lines"
  public_key = tls_private_key.london_tube_lines_tls_private_key.public_key_openssh
}
