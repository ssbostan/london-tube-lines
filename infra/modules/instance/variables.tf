variable "availability_zone_list" {
  type = list(any)
}

variable "vpc_subnet_ids" {
  type = list(any)
}

variable "instance_type" {
  type    = string
  default = "c5.xlarge"
}

variable "key_name" {
  type    = string
  default = "london-tube-lines"
}
