resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id     = aws_eip.nat.id
  subnet_id         = var.subnet_id_public_1
  connectivity_type = "public"

  tags = var.tags_nat
}