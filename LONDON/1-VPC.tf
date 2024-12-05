resource "aws_vpc" "teledoc-london" {
  cidr_block = "10.185.0.0/16"

  tags = {
    Name = "teledoc-london"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
