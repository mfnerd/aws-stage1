resource "aws_internet_gateway" "igw-london" {
  vpc_id = aws_vpc.teledoc-london.id


  tags = {
    Name    = "igw-london"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
