output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

output "allow_tls_sg_id" {
  description = "ID of the security group"
  value       = aws_security_group.allow_tls.id
}