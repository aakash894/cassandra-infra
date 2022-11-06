variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "tags_vpc" {
  default = {}
}

variable "tags_igw" {
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

variable "tags_nat" {
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

variable "ami" {
  default = "ami-017fecd1353bcc96e"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "oregon"
}

variable "tags_ec2_pub" {
  default = {}
}

variable "tags_ec2_priv" {
  default = {}
}

variable "node_count" {
  default = 3
}