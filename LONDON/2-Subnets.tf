#These are   for  public

resource "aws_subnet" "public-eu-west-2a"{
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.185.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-eu-west-2b" {
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.185.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
#these are for private
resource "aws_subnet" "private-eu-west-2a"{
  vpc_id            = aws_vpc.teledoc-london.id
  cidr_block        = "10.185.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "private-eu-west-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.teledoc-london.id
  cidr_block        = "10.185.12.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "private-eu-west-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
