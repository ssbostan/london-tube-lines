resource "aws_vpc" "london_tube_lines_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "london_tube_lines_public_subnet" {
  for_each = zipmap(
    range(1, length(data.aws_availability_zones.london_tube_lines_availability_zone_list.names) + 1),
    data.aws_availability_zones.london_tube_lines_availability_zone_list.names
  )
  vpc_id                  = aws_vpc.london_tube_lines_vpc.id
  availability_zone       = each.value
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1${each.key}.0/24"
}

resource "aws_internet_gateway" "london_tube_lines_internet_gateway" {
  vpc_id = aws_vpc.london_tube_lines_vpc.id
}

resource "aws_route" "london_tube_lines_igw_route" {
  route_table_id         = aws_vpc.london_tube_lines_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.london_tube_lines_internet_gateway.id
}

resource "aws_security_group_rule" "london_tube_lines_public_access_rule" {
  security_group_id = aws_vpc.london_tube_lines_vpc.default_security_group_id
  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
