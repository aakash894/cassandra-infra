output "security_id_dbclient" {
  value = aws_security_group.for_db_client.id
}

output "security_id_dbnodes" {
  value = aws_security_group.for_db_nodes.id
}
