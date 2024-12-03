# this  makes  vpc.id which is aws_vpc.app1.id
provider "aws" {
  region = "ap-east-1"
}
resource "aws_vpc" "teledoc-hk" {
  cidr_block = "10.186.0.0/16"

  tags = {
    Name = "teledoc-hk"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
