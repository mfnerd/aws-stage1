resource "aws_security_group" "app1-sg01-servers" {
  name        = "app1-sg01-servers"
  description = "app1-sg01-servers"
  vpc_id      = aws_vpc.teledoc-aus.id

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
  name        = "app1-sg02-LB01"
  description = "app1-sg02-LB01"
  vpc_id      = aws_vpc.teledoc-aus.id

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