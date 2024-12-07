#Create a Load Balancer for Tokyo
resource "aws_lb" "tokyo_alb" {
  provider                 = aws.tokyo
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-ap-northeast-1a.id,
    aws_subnet.public-ap-northeast-1c.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60
  
  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}

resource "aws_lb_listener" "http" {
  provider          = aws.tokyo
  load_balancer_arn = aws_lb.tokyo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tokyo_tg.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.tokyo_alb.dns_name
  description = "The DNS name of the App1 Load Balancer"
}
#Create a Load Balancer for NYC
resource "aws_lb" "nyc_alb" {
  provider                 = aws.nyc
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1c.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60
  
  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}
resource "aws_lb_listener" "http" {
  provider          = aws.nyc
  load_balancer_arn = aws_lb.nyc_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nyc_tg.arn
  }
}
output "lb_dns_name" {
  value       = aws_lb.nyc_alb.dns_name
  description = "The DNS name of the App1 Load Balancer"
}
#Create a Load Balancer for London
resource "aws_lb" "london_alb" {
  provider                 = aws.london
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-eu-west-2a.id,
    aws_subnet.public-eu-west-2b.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60
  
  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}
resource "aws_lb_listener" "http" {
  provider          = aws.london
  load_balancer_arn = aws_lb.london_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.london_tg.arn
  }
}
output "lb_dns_name" {
  value       = aws_lb.london_alb.dns_name
  description = "The DNS name of the App1 Load Balancer"
}
#Create a Load Balancer for California
resource "aws_lb" "california_alb" {
  provider                 = aws.california
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-us-west-1a.id,
    aws_subnet.public-us-west-1c.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60
  
  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}
resource "aws_lb_listener" "http" {
  provider          = aws.california
  load_balancer_arn = aws_lb.california_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.california_tg.arn
  }
}
output "lb_dns_name" {
  value       = aws_lb.california_alb.dns_name
  description = "The DNS name of the App1 Load Balancer"
}
#Create a Load Balancer for Hong Kong
resource "aws_lb" "hong_kong_alb" {
  provider                 = aws.hongkong
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-ap-southeast-1a.id,
    aws_subnet.public-ap-southeast-1c.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60

  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}
  resource "aws_lb_listener" "http" {
  provider          = aws.hongkong
  load_balancer_arn = aws_lb.hong_kong_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.hong_kong_tg.arn
  }
}
#Create a Load Balancer for Australia
resource "aws_lb" "australia_alb" {
  provider                 = aws.australia
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-ap-southeast-2a.id,
    aws_subnet.public-ap-southeast-2b.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60

  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}
resource "aws_lb_listener" "http" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.australia_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.australia_tg.arn
  }
}
#Create a Load Balancer for Brazil
resource "aws_lb" "brazil_alb" {
  provider                 = aws.brazil
  name                       = "app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-sa-east-1a.id,
    aws_subnet.public-sa-east-1c.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60

  tags = {
    Name        = "App1LoadBalancer"
    Service     = "App1"
    Owner       = "User"
    Project     = "Web Service"
    Environment = "Production"
  }
}