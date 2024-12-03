resource "aws_vpc" "teledoc-nyc" {
  cidr_block = "10.183.0.0/16"

  tags = {
    Name = "teledoc-nyc"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
