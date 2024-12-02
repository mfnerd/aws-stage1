resource "aws_lb" "teledoc" {
  for_each = toset(var.region)
  # provider = (var.alias)
  name                      = "teledoc-${each.key}-load-balancer"
  internal                  = false
  load_balancer_type        = "application"
  security_groups           = [aws_security_group.app1-lb[each.key].id]
  subnets                   = [aws_subnet.public[each.key].id]

  enable_deletion_protection = false
  drop_invalid_header_fields = true
  idle_timeout              = 60
  access_logs {
    bucket  = "nippon-syslogs"
    prefix  = "loadbalancer-logs"
    enabled = true
  }

  tags = {
    Name        = "Teledoc${each.key}LoadBalancer"
    Service     = "TeledocApp1"
    Owner       = "MFNerd"
    Project     = "Teledoc"
    Environment = "Production"
  }
}

resource "aws_lb_listener" "http" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  load_balancer_arn = aws_lb.teledoc[each.key].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app1[each.key].arn
  }
}
