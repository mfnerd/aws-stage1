resource "aws_internet_gateway" "igw-aus" {
  vpc_id = aws_vpc.teledoc-aus.id

  tags = {
    Name    = "igw-aus"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
