output "public_subnets" {
  value = aws_subnet.public_demosubnet[*].id
}

output "private_subnets" {
  value = aws_subnet.private_demosubnet[*].id
}