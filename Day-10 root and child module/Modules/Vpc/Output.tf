output "private_subnet_ids" {
  value = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
}
