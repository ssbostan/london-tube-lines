resource "random_integer" "london_tube_lines_random_number" {
  min = 1
  max = length(var.availability_zone_list)
}

resource "aws_instance" "london_tube_lines_admin_instance" {
  ami                         = "ami-04842bc62789b682e"
  associate_public_ip_address = true
  availability_zone           = var.availability_zone_list[random_integer.london_tube_lines_random_number.result]
  subnet_id                   = var.vpc_subnet_ids[random_integer.london_tube_lines_random_number.result]
  instance_type               = var.instance_type
  key_name                    = var.key_name
}
