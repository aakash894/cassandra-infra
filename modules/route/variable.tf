variable "vpc_id" {
  default = {}
}

variable "igw_id" {
  default = {}
}

variable "nat_id" {
  default = {}
}

variable "subnet_id_private_1" {
  default = {}
}

variable "subnet_id_private_2" {
  default = {}
}

variable "subnet_id_public_1" {
  default = {}
}

variable "subnet_id_public_2" {
  default = {}
}

variable "route_cidr" {
  default = "0.0.0.0/0"
}

variable "tags_public_route" {
  default = {}
}

variable "tags_private_route" {
  default = {}
}