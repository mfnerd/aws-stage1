resource "aws_route_table" "public" {
  vpc_id   = aws_vpc.teledoc-aus.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-aus.id
  }

  tags = {
    Name = "public-aus"
  }
}

resource "aws_route_table" "private" {
  vpc_id   = aws_vpc.teledoc-aus.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-aus.id
  }

  tags = {
    Name = "private-aus"
  }
}

resource "aws_route_table_association" "public-ap-southeast-2a" {
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-ap-southeast-2b" {
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-ap-southeast-2a" {
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-ap-southeast-2b" {
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.private.id
}

# Add routes to the transit gateway
# resource "aws_route" "tgw_routes" {
#   route_table_id = aws_route_table.public.id
#   destination_cidr_block = "10.0.0.0/8" # Adjust as needed
#   transit_gateway_id = aws_vpc_transit_gateway.tgw-tokyo.id
# }
