resource "aws_lb" "teledoc-app1_alb" {
  name                       = "teledoc-app1-load-balancer"
  internal                   = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-sg02-LB01.id]
  subnets                   = [
    aws_subnet.public-ap-northeast-1a.id,
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-eu-west-2a.id,
    aws_subnet.public-sa-east-1a.id,
    aws_subnet.public-ap-southeast-2a.id,
    aws_subnet.public-us-west-1a.id,
    aws_subnet.public-ap-east-1a.id
  ]
  enable_deletion_protection = false
  
  # Add recommended settings
  drop_invalid_header_fields = true
  idle_timeout              = 60
  access_logs {
    bucket  = "nippon-syslogs"
    prefix  = "loadbalancer-logs"
    enabled = true
  }
  tags = {
    Name        = "TeledocApp1LoadBalancer"
    Service     = "TeledocApp1"
    Owner       = "MFNerd"
    Project     = "Teledoc"
    Environment = "Production"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.teledoc-app1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.teledoc-app1_tg.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.teledoc-app1_alb.dns_name
  description = "The DNS name of the App1 Load Balancer"
}

