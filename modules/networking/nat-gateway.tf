/*
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = local.pub_sub_ids[0]
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_route_table" "pr" {
  vpc_id = aws_vpc.myapp.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "b" {
  count          = length(local.pri_sub_ids)
  subnet_id      = local.pri_sub_ids[count.index]
  route_table_id = aws_route_table.pr.id
}
*/