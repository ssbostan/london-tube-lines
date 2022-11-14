module "london_tube_lines_network" {
  source = "./modules/network"
}

module "london_tube_lines_keypair" {
  source = "./modules/keypair"
}

module "london_tube_lines_admin_instance" {
  source                 = "./modules/instance"
  availability_zone_list = module.london_tube_lines_network.availability_zone_list
  vpc_subnet_ids         = module.london_tube_lines_network.vpc_subnet_ids
}
