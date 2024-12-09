#Create Subnets in Tokyo Region
resource "aws_subnet" "public-ap-northeast-1a" {
  provider = aws.tokyo
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
  provider = aws.tokyo
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
  provider = aws.tokyo
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
  provider = aws.tokyo
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

#Create Subnets in NYC Region
resource "aws_subnet" "public-us-east-1a" {
  provider = aws.nyc
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.182.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Neptune"
  }
}
resource "aws_subnet" "public-us-east-1c" {
  provider = aws.nyc
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.182.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Neptune"
  }
}
resource "aws_subnet" "private-us-east-1a" {
  provider = aws.nyc
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.182.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Neptune"
  }
}
resource "aws_subnet" "private-us-east-1c" {
  provider = aws.nyc
  vpc_id                  = aws_vpc.teledoc-nyc.id
  cidr_block              = "10.182.12.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-east-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Neptune"
  }
}

#Create Subnets in London Region
resource "aws_subnet" "public-eu-west-2a" {
  provider                = aws.london
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.183.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Pluto"
  }
}
resource "aws_subnet" "public-eu-west-2b" {
  provider                = aws.london
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.183.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Pluto"
  }
}
resource "aws_subnet" "private-eu-west-2a" {
  provider                = aws.london
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.183.11.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-eu-west-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Pluto"
  }
}
resource "aws_subnet" "private-eu-west-2b" {
  provider = aws.london
  vpc_id                  = aws_vpc.teledoc-london.id
  cidr_block              = "10.183.12.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-eu-west-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Pluto"
  }
}
#Create Subnets in California Region
resource "aws_subnet" "public-us-west-1b" {
  provider = aws.california
  vpc_id                  = aws_vpc.teledoc-california.id
  cidr_block              = "10.184.1.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Saturn"
  }
}
resource "aws_subnet" "public-us-west-1c" {
  provider = aws.california
  vpc_id                  = aws_vpc.teledoc-california.id
  cidr_block              = "10.184.2.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Saturn"
  }
}
resource "aws_subnet" "private-us-west-1b" {
  provider = aws.california
  vpc_id                  = aws_vpc.teledoc-california.id
  cidr_block              = "10.184.11.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-west-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Saturn"
  }
}
resource "aws_subnet" "private-us-west-1c" {
  provider = aws.california
  vpc_id                  = aws_vpc.teledoc-california.id
  cidr_block              = "10.184.12.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-west-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Saturn"
  }
}
#Create Subnets in Hong Kong Region
resource "aws_subnet" "public-ap-east-1a" {
  provider = aws.hongkong
  vpc_id                  = aws_vpc.teledoc-hongkong.id
  cidr_block              = "10.185.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Jupiter"
  }
}
resource "aws_subnet" "public-ap-east-1b" {
  provider = aws.hongkong
  vpc_id                  = aws_vpc.teledoc-hongkong.id
  cidr_block              = "10.185.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Jupiter"
  }
}
resource "aws_subnet" "private-ap-east-1a" {
  provider = aws.hongkong
  vpc_id                  = aws_vpc.teledoc-hongkong.id
  cidr_block              = "10.185.11.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Jupiter"
  }
}
resource "aws_subnet" "private-ap-east-1b" {
  provider = aws.hongkong
  vpc_id                  = aws_vpc.teledoc-hongkong.id
  cidr_block              = "10.185.12.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-east-1b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Jupiter"
  }
}
#Create Subnets in Australia Region
resource "aws_subnet" "public-ap-southeast-2a" {
  provider = aws.australia
  vpc_id                  = aws_vpc.teledoc-australia.id
  cidr_block              = "10.186.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-southeast-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mars"
  }
}
resource "aws_subnet" "public-ap-southeast-2b" {
  provider = aws.australia
  vpc_id                  = aws_vpc.teledoc-australia.id
  cidr_block              = "10.186.2.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true
  tags = {
    Name    = "public-ap-southeast-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mars"
  }
}
resource "aws_subnet" "private-ap-southeast-2a" {
  provider = aws.australia
  vpc_id                  = aws_vpc.teledoc-australia.id
  cidr_block              = "10.186.11.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-southeast-2a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mars"
  }
}
resource "aws_subnet" "private-ap-southeast-2b" {
  provider = aws.australia
  vpc_id                  = aws_vpc.teledoc-australia.id
  cidr_block              = "10.186.12.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-ap-southeast-2b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mars"
  }
}
#Create Subnets in Brazil Region
resource "aws_subnet" "public-sa-east-1a" {
  provider = aws.brazil
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name    = "public-sa-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Venus"
  }
}
resource "aws_subnet" "public-sa-east-1c" {
  provider = aws.brazil
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.2.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name    = "public-sa-east-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Venus"
  }
}
resource "aws_subnet" "private-sa-east-1a" {
  provider = aws.brazil
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.11.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-sa-east-1a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Venus"
  }
}
resource "aws_subnet" "private-sa-east-1c" {
  provider = aws.brazil
  vpc_id                  = aws_vpc.teledoc-brazil.id
  cidr_block              = "10.187.12.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-sa-east-1c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Venus"
  }
}
#Create Subnets in Osaka Region
resource "aws_subnet" "private-ap-northeast-3a" {
  provider = aws.osaka
  vpc_id                  = aws_vpc.teledoc-osaka.id
  cidr_block              = "10.188.11.0/24"
  availability_zone       = "ap-northeast-3a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "private-ap-northeast-3a"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mercury"
  }
}
resource "aws_subnet" "private-ap-northeast-3b" {
  provider = aws.osaka
  vpc_id                  = aws_vpc.teledoc-osaka.id
  cidr_block              = "10.188.12.0/24"
  availability_zone       = "ap-northeast-3b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "private-ap-northeast-3b"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mercury"
  }
}
resource "aws_subnet" "public-ap-northeast-3c" {
  provider = aws.osaka
  vpc_id                  = aws_vpc.teledoc-osaka.id
  cidr_block              = "10.188.1.0/24"
  availability_zone       = "ap-northeast-3c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "private-ap-northeast-3c"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Mercury"
  }
}