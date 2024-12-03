#These are   for  public

resource "aws_subnet" "public-ap-east-1a" {
  vpc_id                  = aws_vpc.teledoc-hk
  cidr_block              = "10.186.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-ap-east-1b" {
  vpc_id                  = aws_vpc.teledoc-hk
  cidr_block              = "10.186.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

#these are for private
resource "aws_subnet" "private-ap-east-1a" {
  vpc_id            = aws_vpc.teledoc-hk
  cidr_block        = "10.186.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name    = "private-ap-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private-ap-east-1b" {
  vpc_id            = aws_vpc.teledoc-hk
  cidr_block        = "10.186.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name    = "private-ap-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
