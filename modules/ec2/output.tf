output "Intance_public_ip" {
  value = aws_instance.db_client.public_ip
}

output "Instance_ips" {
  value = "${formatlist("%v", aws_instance.db_node.*.private_ip)}"
}