resource "aws_internet_gateway" "igw-hk" {
  vpc_id = aws_vpc.teledoc-hk.id

  tags = {
    Name    = "IGW-HK"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
