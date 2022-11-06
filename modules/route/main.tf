resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_cidr
    gateway_id = var.igw_id
  }

  tags = var.tags_public_route
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_cidr
    gateway_id = var.nat_id
  }

  tags = var.tags_private_route
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.subnet_id_public_1
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = var.subnet_id_public_2
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = var.subnet_id_private_1
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = var.subnet_id_private_2
  route_table_id = aws_route_table.private.id
}

