module "vpc" {
  source           = "./modules/vpc"
  vpc_cidr         = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  tags_vpc         = var.tags_vpc
}

module "subnet" {
  source           = "./modules/subnet"
  vpc_id           = module.vpc.vpc_id
  subnet_cidr_1    = var.subnet_cidr_1
  subnet_cidr_2    = var.subnet_cidr_2
  subnet_cidr_3    = var.subnet_cidr_3
  subnet_cidr_4    = var.subnet_cidr_4
  AZ1              = var.AZ1
  AZ2              = var.AZ2
  tags_subnet_pub  = var.tags_subnet_pub
  tags_subnet_priv = var.tags_subnet_priv
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  tags_igw = var.tags_igw
}

module "nat" {
  source             = "./modules/nat"
  subnet_id_public_1 = module.subnet.subnet_id_public_1
  tags_nat           = var.tags_nat
}

module "route" {
  source              = "./modules/route"
  vpc_id              = module.vpc.vpc_id
  subnet_id_public_1  = module.subnet.subnet_id_public_1
  subnet_id_public_2  = module.subnet.subnet_id_public_2
  subnet_id_private_1 = module.subnet.subnet_id_private_1
  subnet_id_private_2 = module.subnet.subnet_id_private_2
  route_cidr          = var.route_cidr
  igw_id              = module.igw.igw_id
  nat_id              = module.nat.nat_id
  tags_public_route   = var.tags_public_route
  tags_private_route  = var.tags_private_route
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = var.ami
  AZ1                  = var.AZ1
  instance_type        = var.instance_type
  subnet_id_public_1   = module.subnet.subnet_id_public_1
  subnet_id_private_1  = module.subnet.subnet_id_private_1
  key_name             = var.key_name
  security_id_dbclient = module.sg.security_id_dbclient
  security_id_dbnodes  = module.sg.security_id_dbnodes
  node_count           = var.node_count
  tags_ec2_pub         = var.tags_ec2_pub
  tags_ec2_priv        = var.tags_ec2_priv
}