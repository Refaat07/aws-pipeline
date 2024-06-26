resource "aws_route_table" "routeTables" {
  count = 2
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = count.index == 0? aws_internet_gateway.main_igw.id:aws_nat_gateway.main_ngw.id
  }
  tags = {
    Name = "${var.common_resource_name}_Public_Route_Table"
  }
}

resource "aws_route_table_association" "public_rt_associate" {
  subnet_id      = aws_subnet.subnets["publicSubnet1"].id
  route_table_id = aws_route_table.routeTables[0].id
}


resource "aws_route_table_association" "private_rt_associate" {
  subnet_id      = aws_subnet.subnets["privateSubnet1"].id
  route_table_id = aws_route_table.routeTables[1].id
}
