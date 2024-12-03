resource "aws_eip" "nat-hk" {
  # vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat-hk" {
  allocation_id = aws_eip.nat-hk.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-hk]
}
