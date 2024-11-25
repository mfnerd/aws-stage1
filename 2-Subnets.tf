#Create subnets for Tokyo
resource "aws_subnet" "public-ap-northeast-1a" {
  vpc_id                  = aws_vpc.teledoc-app1.id
  cidr_block              = "10.187.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-northeast-1b" {
  vpc_id                  = aws_vpc.teledoc-app1.id
  cidr_block              = "10.187.11.0/24"
  availability_zone       = "ap-northeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-northeast-1b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-northeast-1c" {
  vpc_id                  = aws_vpc.teledoc-app1.id
  cidr_block              = "10.187.12.0/24"
  availability_zone       = "ap-northeast-1c" 
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-northeast-1c" 
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for New York
resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.teledoc-app1.id
  cidr_block              = "10.187.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.21.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-us-east-1c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.22.0/24"
  availability_zone = "us-east-1c" 

  tags = {
    Name    = "private-us-east-1c" 
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for London
resource "aws_subnet" "public-eu-west-2a" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.3.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "public-eu-west-2a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.31.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "private-eu-west-2b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-eu-west-2c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.32.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name    = "private-eu-west-2c"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for Sao Paulo
resource "aws_subnet" "public-sa-east-1a" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.4.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name    = "public-sa-east-1a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-sa-east-1b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.41.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name    = "private-sa-east-1b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-sa-east-1c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.42.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name    = "private-sa-east-1c"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for Australia
resource "aws_subnet" "public-ap-southeast-2a" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.5.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name    = "public-ap-southeast-2a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-southeast-2b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.51.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name    = "private-ap-southeast-2b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-southeast-2c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.52.0/24"
  availability_zone = "ap-southeast-2c"

  tags = {
    Name    = "private-ap-southeast-2c"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for Hong Kong
resource "aws_subnet" "public-ap-east-1a" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.6.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name    = "public-ap-east-1a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-east-1b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.61.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name    = "private-ap-east-1b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-ap-east-1c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.62.0/24"
  availability_zone = "ap-east-1c"

  tags = {
    Name    = "private-ap-east-1c"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#Create subnets for California
resource "aws_subnet" "public-us-west-1a" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.7.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name    = "public-us-west-1a"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-us-west-1b" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.71.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name    = "private-us-west-1b"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_subnet" "private-us-west-1c" {
  vpc_id            = aws_vpc.teledoc-app1.id
  cidr_block        = "10.187.72.0/24"
  availability_zone = "us-west-1c"

  tags = {
    Name    = "private-us-west-1c"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}