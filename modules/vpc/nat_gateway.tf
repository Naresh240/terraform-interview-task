resource "aws_eip" "demo_external_ip" {
  vpc = true
  tags = {
    Name = "demo_external_nat_ip"
  }
}

resource "aws_nat_gateway" "demongw" {
    count         = 1
    allocation_id = element(aws_eip.demo_external_ip[*].id, count.index)
    subnet_id     = element(aws_subnet.public_demosubnet[*].id, count.index)
    tags = {
        Name = "demongw"
    }
  depends_on = [aws_internet_gateway.demoigw]
}