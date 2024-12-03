resource "aws_vpc" "teledoc-cali" {
  cidr_block = "10.182.0.0/16"

  tags = {
    Name = "teledoc-cali"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
