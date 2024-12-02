resource "aws_security_group" "app1-servers" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  vpc_id   = aws_vpc.teledoc[each.key].id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.181.0.0/16", "10.182.0.0/16", "10.183.0.0/16", "10.184.0.0/16", "10.185.0.0/16", "10.186.0.0/16", "10.187.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg01-servers-${each.key}"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_security_group" "app1-lb" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  vpc_id   = aws_vpc.teledoc[each.key].id

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
    Name    = "app1-sg02-LB01-${each.key}"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
