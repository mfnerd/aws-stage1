#These are   for  public

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.183.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.183.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#these are for private
resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.teledoc-nyc.id
  cidr_block        = "10.183.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.teledoc-nyc.id
  cidr_block        = "10.183.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

