resource "aws_instance" "db_client" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.AZ1
  subnet_id                   = var.subnet_id_public_1
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_id_dbclient]
  tags                        = var.tags_ec2_pub
  # user_data                   = file("script.sh")
}

resource "aws_instance" "db_node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.AZ1
  subnet_id              = var.subnet_id_private_1
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_id_dbnodes]
  count                  = var.node_count
  tags                   = var.tags_ec2_priv
}