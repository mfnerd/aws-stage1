# this  makes  vpc.id which is aws_vpc.app1.id
provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_vpc" "teledoc-tokyo" {
  cidr_block = "10.181.0.0/16"

  tags = {
    Name = "multi-app1"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
