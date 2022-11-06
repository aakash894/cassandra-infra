output "vpc-id" {
  value = module.vpc.vpc_id
}

output "Public1-subnet-id" {
  value = module.subnet.subnet_id_public_1
}

output "Public2-subnet-id" {
  value = module.subnet.subnet_id_public_2
}

output "Private1-subnet-id" {
  value = module.subnet.subnet_id_private_1
}

output "Private2-subnet-id" {
  value = module.subnet.subnet_id_private_2
}

output "Igw-id" {
  value = module.igw.igw_id
}

output "eip" {
  value = module.nat.eip_id
}

output "nat-id" {
  value = module.nat.nat_id
}

output "Public-routeTB-id" {
  value = module.route.public_route_id
}

output "Private-routeTB-id" {
  value = module.route.private_route_id
}

output "Bastion-publicIP" {
  value = module.ec2.Intance_public_ip
}

output "Db-nodes-privateIP" {
  value = module.ec2.Instance_ips
}
