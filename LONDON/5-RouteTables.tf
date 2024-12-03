resource "aws_route_table" "public" {
  vpc_id   = aws_vpc.teledoc-london.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-london.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id   = aws_vpc.teledoc-london.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-london.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.private.id
}

# # Add routes to the transit gateway
# resource "aws_route" "tgw_routes" {
#   route_table_id = aws_route_table.public.id
#   destination_cidr_block = "10.0.0.0/8" # Adjust as needed
#   transit_gateway_id = aws_vpc_transit_gateway.tgw-tokyo.id
# }
