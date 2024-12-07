#Create target group for tokyo region
resource "aws_lb_target_group" "tokyo_tg" {
  name     = "tokyo-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.tokyo
  vpc_id   = aws_vpc.teledoc-tokyo.id
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
    Name    = "tokyoTargetGroup"
    Service = "tokyo"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for NYC region
resource "aws_lb_target_group" "nyc_tg" {
  name     = "nyc-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.nyc
  vpc_id   = aws_vpc.teledoc-nyc.id
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
    Name    = "nycTargetGroup"
    Service = "nyc"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for London region
resource "aws_lb_target_group" "london_tg" {
  name     = "london-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.london
  vpc_id   = aws_vpc.teledoc-london.id
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
    Name    = "londonTargetGroup"
    Service = "london"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for California region
resource "aws_lb_target_group" "california_tg" {
  name     = "california-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.california
  vpc_id   = aws_vpc.teledoc-california.id
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
    Name    = "californiaTargetGroup"
    Service = "california"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for Hong Kong region
resource "aws_lb_target_group" "hong_kong_tg" {
  name     = "hong-kong-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.hong_kong
  vpc_id   = aws_vpc.teledoc-hong-kong.id
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
    Name    = "hongKongTargetGroup"
    Service = "hongKong"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for Australia region
resource "aws_lb_target_group" "australia_tg" {
  name     = "australia-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.australia
  vpc_id   = aws_vpc.teledoc-australia.id
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
    Name    = "australiaTargetGroup"
    Service = "australia"
    Owner   = "User"
    Project = "Web Service"
  }
}
#Create target group for Brazil region
resource "aws_lb_target_group" "brazil_tg" {
  name     = "brazil-target-group"
  port     = 80
  protocol = "HTTP"
  provider = aws.brazil
  vpc_id   = aws_vpc.teledoc-brazil.id
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
    Name    = "brazilTargetGroup"
    Service = "brazil"
    Owner   = "User"
    Project = "Web Service"
  }
}