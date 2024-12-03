#These are   for  public

resource "aws_subnet" "public-ap-northeast-1a" {
  vpc_id                  = aws_vpc.teledoc-tokyo.id
  cidr_block              = "10.181.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "public-ap-northeast-1c" {
  vpc_id                  = aws_vpc.teledoc-tokyo.id
  cidr_block              = "10.181.2.0/24"
  availability_zone       = "ap-northeast-1c" 
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1c" 
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}


resource "aws_subnet" "private-ap-northeast-1c" {
  vpc_id                  = aws_vpc.teledoc-tokyo.id
  cidr_block              = "10.181.11.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-northeast-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

#these are for private
resource "aws_subnet" "private-ap-northeast-1d" {
  vpc_id            = aws_vpc.teledoc-tokyo.id
  cidr_block        = "10.181.12.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name    = "private-ap-northeast-1d"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"  
  }
}

