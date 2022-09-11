resource "aws_internet_gateway" "demoigw" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    Name = "demo-igw"
  }
}
