resource "aws_vpc" "teledoc-brazil" {
  cidr_block = "10.187.0.0/16"

  tags = {
    Name = "teledoc-brazil"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
