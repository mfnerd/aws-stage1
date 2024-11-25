resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.teledoc-app1.id

  tags = {
    Name    = "app1_IG"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
