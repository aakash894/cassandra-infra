variable "vpc_id" {
  default = {}
}

variable "subnet_cidr_1" {
  default = "10.0.0.0/18"
}

variable "subnet_cidr_2" {
  default = "10.0.64.0/18"
}

variable "subnet_cidr_3" {
  default = "10.0.128.0/18"
}

variable "subnet_cidr_4" {
  default = "10.0.192.0/18"
}

variable "AZ1" {
  default = "us-west-2a"
}

variable "AZ2" {
  default = "us-west-2b"
}

variable "tags_subnet_pub" {
  default = {}
}

variable "tags_subnet_priv" {
  default = {}
}