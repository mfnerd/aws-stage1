resource "aws_eip" "nat-tokyo" {
  # vpc = true

  tags = {
    Name = "nat-tokyo"
  }
}

resource "aws_nat_gateway" "nat-tokyo" {
  allocation_id = aws_eip.nat-tokyo.id
  subnet_id     = aws_subnet.public-ap-northeast-1a.id

  tags = {
    Name = "nat-tokyo"
  }

  depends_on = [aws_internet_gateway.igw-tokyo]
}
