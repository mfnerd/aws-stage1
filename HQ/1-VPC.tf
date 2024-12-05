resource "aws_vpc" "teledoc-tokyo" {
  cidr_block = "10.181.0.0/16"

  tags = {
    Name = "multi-app1"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
