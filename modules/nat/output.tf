output "eip_id" {
  value = aws_eip.nat.id
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}