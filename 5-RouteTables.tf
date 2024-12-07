#Create route tables for public and private subnets for Tokyo
resource "aws_route_table" "public" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.teledoc-tokyo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-tokyo.id
  }

  tags = {
    Name = "public-route-table-tokyo"
  }
}

resource "aws_route_table" "private" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.teledoc-tokyo.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-tokyo.id
  }

  tags = {
    Name = "private-route-table-tokyo"
  }
}

resource "aws_route_table_association" "public-ap-northeast-1a" {
  subnet_id      = aws_subnet.public-ap-northeast-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-ap-northeast-1c" {
  subnet_id      = aws_subnet.public-ap-northeast-1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-ap-northeast-1c" {
  subnet_id      = aws_subnet.private-ap-northeast-1c.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-ap-northeast-1d" {
  subnet_id      = aws_subnet.private-ap-northeast-1d.id
  route_table_id = aws_route_table.private.id
}
#Create route tables for public and private subnets for NYC
resource "aws_route_table" "public" {
  provider = aws.nyc
  vpc_id   = aws_vpc.teledoc-nyc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-nyc.id
  }

  tags = {
    Name = "public-route-table-nyc"
  }
}

resource "aws_route_table" "private" {
  provider = aws.nyc
  vpc_id   = aws_vpc.teledoc-nyc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-nyc.id
  }

  tags = {
    Name = "private-route-table-nyc"
  }
}
resource "aws_route_table_association" "public-us-east-1a" {
  provider = aws.nyc
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-us-east-1c" {
  provider = aws.nyc
  subnet_id      = aws_subnet.public-us-east-1c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-us-east-1a" {
  provider = aws.nyc
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-us-east-1c" {
  provider = aws.nyc
  subnet_id      = aws_subnet.private-us-east-1c.id
  route_table_id = aws_route_table.private.id
}

#Create route tables for public and private subnets for London
resource "aws_route_table" "public" {
  provider = aws.london
  vpc_id   = aws_vpc.teledoc-london.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-london.id
  }

  tags = {
    Name = "public-route-table-london"
  }
}
resource "aws_route_table" "private" {
  provider = aws.london
  vpc_id   = aws_vpc.teledoc-london.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-london.id
  }

  tags = {
    Name = "private-route-table-london"
  }
}
resource "aws_route_table_association" "public-eu-west-2a" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2b.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-eu-west-2a" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2b.id
  route_table_id = aws_route_table.private.id
}

#Create route tables for public and private subnets for California
resource "aws_route_table" "public" {
  provider = aws.california
  vpc_id   = aws_vpc.teledoc-california.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-california.id
  }

  tags = {
    Name = "public-route-table-california"
  }
}
resource "aws_route_table" "private" {
  provider = aws.california
  vpc_id   = aws_vpc.teledoc-california.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-california.id
  }

  tags = {
    Name = "private-route-table-california"
  }
}
resource "aws_route_table_association" "public-us-west-1a" {
  provider = aws.california
  subnet_id      = aws_subnet.public-us-west-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-us-west-1c" {
  provider = aws.california
  subnet_id      = aws_subnet.public-us-west-1c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-us-west-1a" {
  provider = aws.california
  subnet_id      = aws_subnet.private-us-west-1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-us-west-1c" {
  provider = aws.california
  subnet_id      = aws_subnet.private-us-west-1c.id
  route_table_id = aws_route_table.private.id
}

#Create route tables for public and private subnets for Hong Kong
resource "aws_route_table" "public" {
  provider = aws.hongkong
  vpc_id   = aws_vpc.teledoc-hongkong.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-hongkong.id
  }

  tags = {
    Name = "public-route-table-hongkong"
  }
}
resource "aws_route_table" "private" {
  provider = aws.hongkong
  vpc_id   = aws_vpc.teledoc-hongkong.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-hongkong.id
  }

  tags = {
    Name = "private-route-table-hongkong"
  }
}
resource "aws_route_table_association" "public-ap-east-1a" {
  provider = aws.hongkong
  subnet_id      = aws_subnet.public-ap-east-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-ap-east-1c" {
  provider = aws.hongkong
  subnet_id      = aws_subnet.public-ap-east-1c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-ap-east-1a" {
  provider = aws.hongkong
  subnet_id      = aws_subnet.private-ap-east-1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-ap-east-1c" {
  provider = aws.hongkong
  subnet_id      = aws_subnet.private-ap-east-1c.id
  route_table_id = aws_route_table.private.id
}

#Create route tables for public and private subnets for Australia
resource "aws_route_table" "public" {
  provider = aws.australia
  vpc_id   = aws_vpc.teledoc-australia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-australia.id
  }

  tags = {
    Name = "public-route-table-australia"
  }
}
resource "aws_route_table" "private" {
  provider = aws.australia
  vpc_id   = aws_vpc.teledoc-australia.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-australia.id
  }

  tags = {
    Name = "private-route-table-australia"
  }
}
resource "aws_route_table_association" "public-ap-southeast-2a" {
  provider = aws.australia
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-ap-southeast-2b" {
  provider = aws.australia
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-ap-southeast-2a" {
  provider = aws.australia
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-ap-southeast-2b" {
  provider = aws.australia
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.private.id
}

#Create route tables for public and private subnets for Brazil
resource "aws_route_table" "public" {
  provider = aws.brazil
  vpc_id   = aws_vpc.teledoc-brazil.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-brazil.id
  }

  tags = {
    Name = "public-route-table-brazil"
  }
}
resource "aws_route_table" "private" {
  provider = aws.brazil
  vpc_id   = aws_vpc.teledoc-brazil.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-brazil.id
  }

  tags = {
    Name = "private-route-table-brazil"
  }
}
resource "aws_route_table_association" "public-sa-east-1a" {
  provider = aws.brazil
  subnet_id      = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-sa-east-1c" {
  provider = aws.brazil
  subnet_id      = aws_subnet.public-sa-east-1c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-sa-east-1a" {
  provider = aws.brazil
  subnet_id      = aws_subnet.private-sa-east-1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-sa-east-1c" {
  provider = aws.brazil
  subnet_id      = aws_subnet.private-sa-east-1c.id
  route_table_id = aws_route_table.private.id
}