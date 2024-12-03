#These are   for  public

resource "aws_subnet" "public-sa-east-1a" {
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-sa-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-sa-east-1b" {
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.2.0/24"
  availability_zone       = "sa-east-1b" 
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-sa-east-1b" 
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

#these are for private
resource "aws_subnet" "private-sa-east-1a" {
  vpc_id            = aws_vpc.teledoc-brazil.id
  cidr_block        = "10.187.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name    = "private-sa-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private-sa-east-1b" {
  vpc_id            = aws_vpc.teledoc-brazil.id
  cidr_block        = "10.187.12.0/24"
  availability_zone = "sa-east-1b" 

  tags = {
    Name    = "private-sa-east-1b" 
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

