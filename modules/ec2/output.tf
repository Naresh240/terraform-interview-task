output "aws_instance" {
  value = aws_instance.example.*.private_ip
}