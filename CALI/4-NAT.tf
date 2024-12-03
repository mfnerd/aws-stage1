resource "aws_eip" "nat-cali" {
  # vpc = true

  tags = {
    Name = "nat-cali"
  }
}

resource "aws_nat_gateway" "nat-cali" {
  allocation_id = aws_eip.nat-cali.id
  subnet_id     = aws_subnet.public-us-west-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-cali]
}
