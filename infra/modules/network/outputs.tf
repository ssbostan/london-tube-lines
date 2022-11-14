output "availability_zone_list" {
  value = data.aws_availability_zones.london_tube_lines_availability_zone_list.names
}

output "vpc_subnet_ids" {
  value = [
    for k, _ in aws_subnet.london_tube_lines_public_subnet : aws_subnet.london_tube_lines_public_subnet[k].id
  ]
}
