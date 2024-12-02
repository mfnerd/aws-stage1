#Create an internet gateway for each region
resource "aws_internet_gateway" "igw" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  vpc_id   = aws_vpc.teledoc[each.key].id

  tags = {
    Name    = "app1_IG"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
