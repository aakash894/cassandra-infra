resource "aws_subnet" "public1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_1
  availability_zone = var.AZ1
  tags              = var.tags_subnet_pub
}

resource "aws_subnet" "public2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_2
  availability_zone = var.AZ2
  tags              = var.tags_subnet_pub
}

resource "aws_subnet" "private1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_3
  availability_zone = var.AZ1
  tags              = var.tags_subnet_priv
}

resource "aws_subnet" "private2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_4
  availability_zone = var.AZ2
  tags              = var.tags_subnet_priv
}