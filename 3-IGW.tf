#Create internet gateway in Tokyo, NYC, London, California, Hong Kong, Australia, and Brazil
resource "aws_internet_gateway" "igw-tokyo" {
  provider = aws.tokyo
  vpc_id = aws_vpc.teledoc-tokyo.id

  tags = {
    Name    = "tokyo_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
resource "aws_internet_gateway" "igw-nyc" {
  provider = aws.nyc
  vpc_id = aws_vpc.teledoc-nyc.id

  tags = {
    Name    = "nyc_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Neptune"
  }
}
resource "aws_internet_gateway" "igw-london" {
  provider = aws.london
  vpc_id = aws_vpc.teledoc-london.id

  tags = {
    Name    = "london_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mars"
  }
}
resource "aws_internet_gateway" "igw-california" {
  provider = aws.california
  vpc_id = aws_vpc.teledoc-california.id

  tags = {
    Name    = "california_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
resource "aws_internet_gateway" "igw-hongkong" {
  provider = aws.hongkong
  vpc_id = aws_vpc.teledoc-hongkong.id

  tags = {
    Name    = "hongkong_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Jupiter"
  }
}
resource "aws_internet_gateway" "igw-australia" {
  provider = aws.australia
  vpc_id = aws_vpc.teledoc-australia.id

  tags = {
    Name    = "australia_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Saturn"
  }
}
resource "aws_internet_gateway" "igw-brazil" {
  provider = aws.brazil
  vpc_id = aws_vpc.teledoc-brazil.id

  tags = {
    Name    = "brazil_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Venus"
  }
}
#Create internet gateway in Osaka
resource "aws_internet_gateway" "igw-osaka" {
  provider = aws.osaka
  vpc_id = aws_vpc.teledoc-osaka.id

  tags = {
    Name    = "osaka_IGW"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mercury"
  }
}