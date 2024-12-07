#Create NAT gateways for each region
resource "aws_eip" "nat-tokyo" {
  provider = aws.tokyo
  tags = {
    Name = "nat-tokyo"
  }
}
resource "aws_nat_gateway" "nat-tokyo" {
  provider = aws.tokyo
  allocation_id = aws_eip.nat-tokyo.id
  subnet_id     = aws_subnet.public-ap-northeast-1a.id

  tags = {
    Name = "nat-tokyo"
  }

  depends_on = [aws_internet_gateway.igw-tokyo]
}

resource "aws_eip" "nat-nyc" {
  provider = aws.nyc
  tags = {
    Name = "nat-nyc"
  }
}
resource "aws_nat_gateway" "nat-nyc" {
  provider = aws.nyc
  allocation_id = aws_eip.nat-nyc.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "nat-nyc"
  }

  depends_on = [aws_internet_gateway.igw-nyc]
}

resource "aws_eip" "nat-london" {
  provider = aws.london
  tags = {
    Name = "nat-london"
  }
}
resource "aws_nat_gateway" "nat-london" {
  provider = aws.london
  allocation_id = aws_eip.nat-london.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name = "nat-london"
  }

  depends_on = [aws_internet_gateway.igw-london]
}

resource "aws_eip" "nat-california" {
  provider = aws.california
  tags = {
    Name = "nat-california"
  }
}
resource "aws_nat_gateway" "nat-california" {
  provider = aws.california
  allocation_id = aws_eip.nat-california.id
  subnet_id     = aws_subnet.public-us-west-1a.id

  tags = {
    Name = "nat-california"
  }

  depends_on = [aws_internet_gateway.igw-california]
}

resource "aws_eip" "nat-hongkong" {
  provider = aws.hongkong
  tags = {
    Name = "nat-hongkong"
  }
}
resource "aws_nat_gateway" "nat-hongkong" {
  provider = aws.hongkong
  allocation_id = aws_eip.nat-hongkong.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name = "nat-hongkong"
  }

  depends_on = [aws_internet_gateway.igw-hongkong]
}

resource "aws_eip" "nat-australia" {
  provider = aws.australia
  tags = {
    Name = "nat-australia"
  }
}
resource "aws_nat_gateway" "nat-australia" {
  provider = aws.australia
  allocation_id = aws_eip.nat-australia.id
  subnet_id     = aws_subnet.public-ap-southeast-1a.id

  tags = {
    Name = "nat-australia"
  }
  depends_on = [aws_internet_gateway.igw-australia]
}

resource "aws_eip" "nat-brazil" {
  provider = aws.brazil
  tags = {
    Name = "nat-brazil"
  }
}
resource "aws_nat_gateway" "nat-brazil" {
  provider = aws.brazil
  allocation_id = aws_eip.nat-brazil.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name = "nat-brazil"
  }
  depends_on = [aws_internet_gateway.igw-brazil]
}