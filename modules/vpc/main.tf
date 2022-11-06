resource "aws_vpc" "db" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = var.tags_vpc
}