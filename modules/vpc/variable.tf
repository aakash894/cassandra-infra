variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "tags_vpc" {
  default = {}
}