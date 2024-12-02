resource "aws_lb_target_group" "app1" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  name     = "app1-target-group-${each.key}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.teledoc[each.key].id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "App1TargetGroup-${each.key}"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}