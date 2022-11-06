variable "subnet_id_public_1" {
  default = {}
}

variable "subnet_id_private_1" {
  default = {}
}

variable "security_id_dbclient" {
  default = {}
}

variable "security_id_dbnodes" {
  default = {}
}

variable "AZ1" {
  default = "us-west-2a"
}

variable "ami" {
  default = "ami-017fecd1353bcc96e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform"
}

variable "tags_ec2_pub" {
  default = {}
}

variable "tags_ec2_priv" {
  default = {}
}

variable "node_count" {
  default = 5
}