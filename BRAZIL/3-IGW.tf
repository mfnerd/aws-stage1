resource "aws_internet_gateway" "igw-brz" {
  vpc_id = aws_vpc.multi-app1.id

  tags = {
    Name    = "igw-brz"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
