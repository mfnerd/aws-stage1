#These are   for  public

resource "aws_subnet" "public-us-west-1a" {
  vpc_id                  = aws_vpc.teledoc-cali.id
  cidr_block              = "10.182.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-us-west-1b" {
  vpc_id                  = aws_vpc.teledoc-cali.id
  cidr_block              = "10.182.2.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

#these are for private
resource "aws_subnet" "private-us-west-1a" {
  vpc_id            = aws_vpc.teledoc-cali.id
  cidr_block        = "10.182.11.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name    = "private-us-west-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private-us-west-1b" {
  vpc_id            = aws_vpc.teledoc-cali.id
  cidr_block        = "10.182.12.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name    = "private-us-west-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
