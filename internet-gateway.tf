resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myapp.id

  tags = {
    Name = "JavaHomeGW"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.myapp.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(aws_subnet.public.*.id)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.r.id
}