region           = "us-west-2"
vpc_cidr         = "10.0.0.0/16"
instance_tenancy = "default"
tags_vpc = {
  Name  = "Cassandra_DB"
  Type  = "Database"
  Owner = "aakash"
}
tags_igw = {
  Name  = "Cassandra_igw"
  Type  = "Database"
  Owner = "aakash"
}
subnet_cidr_1 = "10.0.0.0/18"
subnet_cidr_2 = "10.0.64.0/18"
subnet_cidr_3 = "10.0.128.0/18"
subnet_cidr_4 = "10.0.192.0/18"
AZ1           = "us-west-2a"
AZ2           = "us-west-2a"
tags_subnet_pub = {
  Name  = "Cassandra_subnet_pub"
  Type  = "Database"
  Owner = "aakash"
}
tags_subnet_priv = {
  Name  = "Cassandra_subnet-priv"
  Type  = "Database"
  Owner = "aakash"
}
tags_nat = {
  Name  = "Cassandra_nat"
  Type  = "Database"
  Owner = "aakash"
}
tags_public_route = {
  Name  = "Cassandra_public_RT"
  Type  = "Database"
  Owner = "aakash"
}
tags_private_route = {
  Name  = "Cassandra_private_RT"
  Type  = "Database"
  Owner = "aakash"
}
ami = "ami-017fecd1353bcc96e"
instance_type = "t2.medium"
key_name = "oregon"
node_count = 3
tags_ec2_pub = {
  Name  = "Cassandra-bastion"
  Type  = "Database"
  Owner = "aakash"
  Category = "bastion"
}
tags_ec2_priv = {
  Name  = "Cassandra-nodes"
  Type  = "Database"
  Owner = "aakash"
  Category = "Nodes"
}