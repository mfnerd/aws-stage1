resource "aws_lb" "brazil_alb" {
  name                       = "brazil-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-sa-east-1a.id,
    aws_subnet.public-sa-east-1b.id
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
  load_balancer_arn = aws_lb.brazil_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.brazil_tg
  }
}

output "lb_dns_name" {
  value       = aws_lb.brazil_alb.dns_name
  description = "The DNS name of the Brazil Load Balancer"
}
