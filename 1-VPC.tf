# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "teledoc-app1" {
  cidr_block = "10.187.0.0/16"

  tags = {
    Name = "teledoc-app1"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
