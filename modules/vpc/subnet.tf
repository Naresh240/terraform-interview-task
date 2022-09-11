resource "aws_subnet" "public_demosubnet" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_demosubnet${count.index}"
  }
}

resource "aws_subnet" "private_demosubnet" {
  count                   = length(var.private_subnets_cidr)
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.private_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = {
    Name = "private_demosubnet${count.index}"
  }
}