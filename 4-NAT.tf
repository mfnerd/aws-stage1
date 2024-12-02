#Create a NAT Gateway for each region
resource "aws_eip" "nat" {
  for_each = toset(var.region)
  tags = {
    Name = "nat-${each.key}"
  }
}

resource "aws_nat_gateway" "nat" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "nat-${each.key}"
  }
  # depends_on = [aws_internet_gateway.igw[each.key]]
}
