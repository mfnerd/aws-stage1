resource "aws_internet_gateway" "igw-nyc" {
  vpc_id = aws_vpc.teledoc-nyc.id

  tags = {
    Name    = "igw-nyc"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
