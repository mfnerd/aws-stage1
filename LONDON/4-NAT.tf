resource "aws_eip" "nat-london" {
  # vpc = true

  tags = {
    Name = "nat-london"
  }
}

resource "aws_nat_gateway" "nat-london" {
  allocation_id = aws_eip.nat-london.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name = "nat-london"
  }

  depends_on = [aws_internet_gateway.igw-london]
}
