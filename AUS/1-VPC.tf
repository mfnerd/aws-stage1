resource "aws_vpc" "teledoc-aus" {
  cidr_block = "10.184.0.0/16"

  tags = {
    Name = "teledoc-aus"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
