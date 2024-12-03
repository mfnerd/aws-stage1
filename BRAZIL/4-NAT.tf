resource "aws_eip" "nat-brz" {
  # vpc = true

  tags = {
    Name = "nat-brz"
  }
}

resource "aws_nat_gateway" "nat-brz" {
  allocation_id = aws_eip.nat-brz.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-brz]
}
