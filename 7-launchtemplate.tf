#Create a Launch Template in the Tokyo region with the following attributes:
resource "aws_launch_template" "tokyo_LT" {
  provider = aws.tokyo
  name_prefix   = "tokyo_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "jp_JP.UTF-8" LANG: "jp" LC_ALL: "jp_JP.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-tokyo"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Launch Template in the Tokyo region with the following attributes:
resource "aws_launch_template" "nyc_LT" {
  provider = aws.nyc
  name_prefix   = "nyc_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_US.UTF-8" LANG: "en" LC_ALL: "en_US.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-nyc"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Launch Template in the London region with the following attributes: 
resource "aws_launch_template" "london_LT" {
  provider = aws.london
  name_prefix   = "london_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_GB.UTF-8" LANG: "en" LC_ALL: "en_GB.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-london"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Launch Template in California with the following attributes:
resource "aws_launch_template" "california_LT" {
  provider = aws.california
  name_prefix   = "california_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_US.UTF-8" LANG: "en" LC_ALL: "en_US.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-california"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Launch Template in Hong Kong with the following attributes:
resource "aws_launch_template" "hongkong_LT" {
  provider = aws.hongkong
  name_prefix   = "hongkong_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "zh_CN.UTF-8" LANG: "zh" LC_ALL: "zh_CN.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-hongkong"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Launch Template in Australia with the following attributes: 
resource "aws_launch_template" "australia_LT" {
  provider = aws.australia
  name_prefix   = "australia_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_AU.UTF-8" LANG: "en" LC_ALL: "en_AU.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-australia"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
#Create a Lauch Template in Brazil with the following attributes:
resource "aws_launch_template" "brazil_LT" {
  provider = aws.brazil
  name_prefix   = "brazil_LT"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  # key_name      = "linuxbox"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "pt_BR.UTF-8" LANG: "pt" LC_ALL: "pt_BR.UTF-8"
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/etc/amazon-cloudwatch-agent/config.json -s
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-brazil"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}