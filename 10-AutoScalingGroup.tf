# Create Auto Scaling Group for each region within two availability zones
resource "aws_autoscaling_group" "app1_asg" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  name_prefix           = "app1-${each.key}-auto-scaling-group-"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
  vpc_zone_identifier   = [
    aws_subnet.private[each.key].id,
    aws_subnet.private[each.key].id,
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.app1[each.key].arn]

  launch_template {
    id      = aws_launch_template.app1[each.key].id
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
    value               = "app1-instance-${each.key}"
    propagate_at_launch = true
  }
}