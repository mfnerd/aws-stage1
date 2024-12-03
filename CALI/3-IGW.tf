resource "aws_internet_gateway" "igw-cali" {
  vpc_id = aws_vpc.teledoc-cali.id

  tags = {
    Name    = "igw-cali"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
