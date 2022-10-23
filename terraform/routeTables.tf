resource "aws_route_table" "public_routeTable" {
  vpc_id = aws_vpc.iti_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti_gw.id
  }

  tags = {
    Name = "${var.env}_public_routeTable"
  }
}

resource "aws_route_table_association" "public1_routeTable_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_routeTable.id
}

resource "aws_route_table_association" "public2_routeTable_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_routeTable.id
}