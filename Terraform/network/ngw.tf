resource "aws_eip" "main_nat_eip" {
  domain = "vpc"
  tags = {
    "Name" = "${var.common_resource_name}_EIP"
  }
}

resource "aws_nat_gateway" "main_ngw" {
  allocation_id = aws_eip.main_nat_eip.id
  subnet_id     = aws_subnet.subnets["publicSubnet1"].id
  depends_on    = [aws_internet_gateway.main_igw] 

  tags = {
    Name = "${var.common_resource_name}_NGW"
  }
}