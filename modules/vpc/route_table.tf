resource "aws_route_table" "demopublicrt" {
  vpc_id  = aws_vpc.demovpc.id
  tags = {
    Name = "demo_public_rt"
  }
}
resource "aws_route" "public_internet_gateway_ipv6" {
  route_table_id              = aws_route_table.demopublicrt.id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id                  = aws_internet_gateway.demoigw.id
}
resource "aws_route_table_association" "rt_public_subnet" {
  count           = length(var.public_subnets_cidr) 
  subnet_id       = element(aws_subnet.public_demosubnet[*].id, count.index)
  route_table_id  = aws_route_table.demopublicrt.id
}

resource "aws_route_table" "demoprivatert" {
  vpc_id    = aws_vpc.demovpc.id
  tags = {
    Name = "demo_private_rt"
  }
}
resource "aws_route" "private_natgateway_ipv6" {
  route_table_id              = aws_route_table.demoprivatert.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.demongw[0].id
}
resource "aws_route_table_association" "rt_associate_private" {
  count           = length(var.private_subnets_cidr) 
  subnet_id       = element(aws_subnet.private_demosubnet[*].id, count.index)
  route_table_id  = aws_route_table.demoprivatert.id
}