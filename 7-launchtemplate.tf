resource "aws_launch_template" "app1" {
  for_each = toset(var.region)
  # provider = aws[lookup(var.alias, each.key)]
  name_prefix   = "app1_${each.key}_LT"
  image_id      = lookup(var.image_id, each.key)
  instance_type = "t2.micro"
  key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-servers[each.key].id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: ${var.locale} LANG: ${var.lang} LC_ALL: ${var.lc_all}
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-${each.key}"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
