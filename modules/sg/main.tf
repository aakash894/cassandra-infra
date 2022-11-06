resource "aws_security_group" "for_db_client" {
  name        = "Cassandra-sg"
  description = "sg for db client"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "SG-bastion"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "Cassandra-sg"
  }
}

resource "aws_security_group" "for_db_nodes" {
  name        = "Cassandra-sg-nodes"
  description = "sg for db nodes"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80, 443, 7000, 7001, 7199, 9042, 9160, 9142]
    iterator = port
    content {
      description = "SG-nodes"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "Cassandra-sg"
  }
}