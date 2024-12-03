resource "aws_internet_gateway" "igw-tokyo" {
  vpc_id = aws_vpc.teledoc-tokyo.id

  tags = {
    Name    = "app1_IG"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
