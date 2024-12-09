# Create Auto Scaling Group for Tokyo within two availability zones
resource "aws_autoscaling_group" "tokyo_asg" {
  provider              = aws.tokyo
  name_prefix           = "teledoc-jp-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-ap-northeast-1c.id,
    aws_subnet.private-ap-northeast-1d.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tokyo_tg.arn]

  launch_template {
    id      = aws_launch_template.tokyo_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "tokyo-asg-instance"
    propagate_at_launch = true
  }
}
# Create Auto Scaling Group for NYC within two availability zones
resource "aws_autoscaling_group" "nyc_asg" {
  provider              = aws.nyc
  name_prefix           = "teledoc-nyc-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.nyc_tg.arn]

  launch_template {
    id      = aws_launch_template.nyc_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "nyc-asg-instance"
    propagate_at_launch = true
  }
}
# Create Auto Scaling Group for London within two availability zones
resource "aws_autoscaling_group" "london_asg" {
  provider              = aws.london
  name_prefix           = "teledoc-london-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-eu-west-2a.id,
    aws_subnet.private-eu-west-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.london_tg.arn]

  launch_template {
    id      = aws_launch_template.london_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "london-asg-instance"
    propagate_at_launch = true
  }
}
# Create Auto Scaling Group for California within two availability zones
resource "aws_autoscaling_group" "california_asg" {
  provider              = aws.california
  name_prefix           = "teledoc-california-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-us-west-1b.id,
    aws_subnet.private-us-west-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.california_tg.arn]

  launch_template {
    id      = aws_launch_template.california_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "california-asg-instance"
    propagate_at_launch = true
  }
}
#Create an Auto Scaling Group for Hong Kong within two availability zones
resource "aws_autoscaling_group" "hongkong_asg" {
  provider              = aws.hongkong
  name_prefix           = "teledoc-hongkong-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-ap-east-1a.id,
    aws_subnet.private-ap-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.hong_kong_tg.arn]

  launch_template {
    id      = aws_launch_template.hongkong_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "hongkong-asg-instance"
    propagate_at_launch = true
  }
}
#Create an Auto Scaling Group for Australia within two availability zones
resource "aws_autoscaling_group" "australia_asg" {
  provider              = aws.australia
  name_prefix           = "teledoc-australia-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-ap-southeast-2a.id,
    aws_subnet.private-ap-southeast-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.australia_tg.arn]

  launch_template {
    id      = aws_launch_template.australia_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "australia-asg-instance"
    propagate_at_launch = true
  }
}
#Create an Auto Scaling Group for Brazil within two availability zones
resource "aws_autoscaling_group" "brazil_asg" {
  provider              = aws.brazil
  name_prefix           = "teledoc-brazil-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-sa-east-1a.id,
    aws_subnet.private-sa-east-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.brazil_tg.arn]

  launch_template {
    id      = aws_launch_template.brazil_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "brazil-asg-instance"
    propagate_at_launch = true
  }
}
#Create an Auto Scaling Group for Osaka within two availability zones
resource "aws_autoscaling_group" "osaka_asg" {
  provider              = aws.osaka
  name_prefix           = "teledoc-osaka-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private-ap-northeast-3a.id,
    aws_subnet.private-ap-northeast-3b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.osaka_tg.arn]

  launch_template {
    id      = aws_launch_template.osaka_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  tag {
    key                 = "Name"
    value               = "osaka-asg-instance"
    propagate_at_launch = true
  }
}
