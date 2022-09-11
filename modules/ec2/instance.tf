resource "aws_instance" "example" {
  ami             = lookup(var.instance_ami, var.region)
  instance_type   = var.instance_type
  count           = var.instance_count
  subnet_id       = element(var.private_subnets[*], count.index)
  key_name        = var.key_name

  tags = {
    Name = "${var.profile}-instance"
    Environment = var.environment
  }
}