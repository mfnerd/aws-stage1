resource "aws_eip" "nat-aus" {
  # vpc = true

  tags = {
    Name = "nat-aus"
  }
}

resource "aws_nat_gateway" "nat-aus" {
  allocation_id = aws_eip.nat-aus.id
  subnet_id     = aws_subnet.public-ap-southeast-2a.id

  tags = {
    Name = "nat-aus"
  }

  depends_on = [aws_internet_gateway.igw-aus]
}
