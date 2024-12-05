resource "aws_route_table" "public" {
  vpc_id   = aws_vpc.teledoc-brazil.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-brz.id
  }

  tags = {
    Name = "public-brazil"
  }
}

resource "aws_route_table" "private" {
  vpc_id   = aws_vpc.teledoc-brazil.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-brz.id
  }

  tags = {
    Name = "private-brazil"
  }
}

resource "aws_route_table_association" "public-sa-east-1a" {
  subnet_id      = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-sa-east-1b" {
  subnet_id      = aws_subnet.public-sa-east-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-sa-east-1a" {
  subnet_id      = aws_subnet.private-sa-east-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-sa-east-1b" {
  subnet_id      = aws_subnet.private-sa-east-1b.id
  route_table_id = aws_route_table.private.id
}

# # Add routes to the transit gateway
# # resource "aws_route" "tgw_routes" {
# #   route_table_id = aws_route_table.public.id
# #   destination_cidr_block = "10.0.0.0/8" # Adjust as needed
# #   transit_gateway_id = aws_vpc_transit_gateway.tgw-tokyo.id
# # }
