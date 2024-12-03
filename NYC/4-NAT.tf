resource "aws_eip" "nat-nyc" {
  # vpc = true

  tags = {
    Name = "nat-nyc"
  }
}

resource "aws_nat_gateway" "nat-nyc" {
  allocation_id = aws_eip.nat-nyc.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-nyc]
}
