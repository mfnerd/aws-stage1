#Create VPC in Tokyo, NYC, London, California, Hong Kong, Australia, and Brazil

resource "aws_vpc" "teledoc-tokyo" {
  provider = aws.tokyo
  cidr_block = "10.181.0.0/16"

  tags = {
    Name = "teledoc-tokyo"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-nyc" {
  provider = aws.nyc
  cidr_block = "10.182.0.0/16"

  tags = {
    Name = "teledoc-nyc"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-london" {
  provider = aws.london
  cidr_block = "10.183.0.0/16"

  tags = {
    Name = "teledoc-london"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-california" {
  provider = aws.california
  cidr_block = "10.184.0.0/16"

  tags = {
    Name = "teledoc-california"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-hongkong" {
  provider = aws.hongkong
  cidr_block = "10.185.0.0/16"

  tags = {
    Name = "teledoc-hongkong"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-australia" {
  provider = aws.australia
  cidr_block = "10.186.0.0/16"

  tags = {
    Name = "teledoc-australia"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}
resource "aws_vpc" "teledoc-brazil" {
  provider = aws.brazil
  cidr_block = "10.187.0.0/16"

  tags = {
    Name = "teledoc-brazil"
    Service = "applicationLB"
    Owner = "MFnerd"
    Planet = "Uranus"
  }
}