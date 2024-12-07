#Create a security group for Tokyo's loadbalancer and autoscaling group
#
resource "aws_security_group" "app1-sg01-servers" {
  provider    = aws.tokyo
  name        = "app1-sg01-servers"
  description = "app1-sg01-servers"
  vpc_id      = aws_vpc.teledoc-tokyo.id

ingress {
  description = "MyHomePage"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg01-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }

}

resource "aws_security_group" "app1-sg02-LB01" {
  provider    = aws.tokyo
  name        = "app1-sg02-LB01"
  description = "app1-sg02-LB01"
  vpc_id      = aws_vpc.teledoc-tokyo.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg02-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }

}
#Create a security group for NYC's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg03-servers"{
  provider    = aws.nyc
  name        = "app1-sg03-servers"
  description = "app1-sg03-servers"
  vpc_id      = aws_vpc.teledoc-nyc.id

ingress {
  description = "MyHomePage"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg03-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }

}
resource "aws_security_group" "app1-sg04-LB01" {
  provider    = aws.nyc
  name        = "app1-sg04-LB01"
  description = "app1-sg04-LB01"
  vpc_id      = aws_vpc.teledoc-nyc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg04-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
#Create a security group for London's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg05-servers" {
  provider    = aws.london
  name        = "app1-sg05-servers"
  description = "app1-sg05-servers"
  vpc_id      = aws_vpc.teledoc-london.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg05-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }

}
resource "aws_security_group" "app1-sg06-LB01" {
  provider    = aws.london
  name        = "app1-sg06-LB01"
  description = "app1-sg06-LB01"
  vpc_id      = aws_vpc.teledoc-london.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg06-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
#Create a security group for California's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg07-servers" {
  provider    = aws.california
  name        = "app1-sg07-servers"
  description = "app1-sg07-servers"
  vpc_id      = aws_vpc.teledoc-california.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg07-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
resource "aws_security_group" "app1-sg08-LB01" {
  provider    = aws.california
  name        = "app1-sg08-LB01"
  description = "app1-sg08-LB01"
  vpc_id      = aws_vpc.teledoc-california.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg08-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
#Create a security group for Hong Kong's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg09-servers" {
  provider    = aws.hongkong
  name        = "app1-sg09-servers"
  description = "app1-sg09-servers"
  vpc_id      = aws_vpc.teledoc-hongkong.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg09-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
resource "aws_security_group" "app1-sg10-LB01" {
  provider    = aws.hongkong
  name        = "app1-sg10-LB01"
  description = "app1-sg10-LB01"
  vpc_id      = aws_vpc.teledoc-hongkong.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg10-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
#Create a security group for Australia's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg11-servers" {
  provider    = aws.australia
  name        = "app1-sg11-servers"
  description = "app1-sg11-servers"
  vpc_id      = aws_vpc.teledoc-australia.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg11-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
resource "aws_security_group" "app1-sg12-LB01" {
  provider    = aws.australia
  name        = "app1-sg12-LB01"
  description = "app1-sg12-LB01"
  vpc_id      = aws_vpc.teledoc-australia.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg12-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
#Create a security group for Brazil's loadbalancer and autoscaling group
resource "aws_security_group" "app1-sg13-servers" {
  provider    = aws.brazil
  name        = "app1-sg13-servers"
  description = "app1-sg13-servers"
  vpc_id      = aws_vpc.teledoc-brazil.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg13-servers"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}
resource "aws_security_group" "app1-sg14-LB01" {
  provider    = aws.brazil
  name        = "app1-sg14-LB01"
  description = "app1-sg14-LB01"
  vpc_id      = aws_vpc.teledoc-brazil.id
  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "app1-sg14-LB01"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Earth"
  }
}