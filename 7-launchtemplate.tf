#Create a Launch Template in the Tokyo region with the following attributes:
resource "aws_launch_template" "tokyo_LT" {
  provider = aws.tokyo
  name_prefix   = "tokyo_LT"
  image_id      = "ami-023ff3d4ab11b2525"
  instance_type = "t2.micro"
  key_name      = "linuxbox-tokyo"
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "jp_JP.UTF-8" LANG: "jp" LC_ALL: "jp_JP.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = "linuxbox-nyc"
  vpc_security_group_ids = [aws_security_group.app1-sg03-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_US.UTF-8" LANG: "en" LC_ALL: "en_US.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-0c76bd4bd302b30ec"
  instance_type = "t2.micro"
  key_name      = "linuxbox-london"
  vpc_security_group_ids = [aws_security_group.app1-sg05-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_GB.UTF-8" LANG: "en" LC_ALL: "en_GB.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-038bba9a164eb3dc1"
  instance_type = "t2.micro"
  key_name      = "linuxbox-cali"
  vpc_security_group_ids = [aws_security_group.app1-sg07-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_US.UTF-8" LANG: "en" LC_ALL: "en_US.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-06f707739f2271995"
  instance_type = "t3.micro"
  key_name      = "linuxbox-hk"
  vpc_security_group_ids = [aws_security_group.app1-sg09-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "zh_CN.UTF-8" LANG: "zh" LC_ALL: "zh_CN.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-0146fc9ad419e2cfd"
  instance_type = "t2.micro"
  key_name      = "linuxbox-au"
  vpc_security_group_ids = [aws_security_group.app1-sg11-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "en_AU.UTF-8" LANG: "en" LC_ALL: "en_AU.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog
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
  image_id      = "ami-0c820c196a818d66a"
  instance_type = "t2.micro"
  key_name      = "linuxbox-brazil"
  vpc_security_group_ids = [aws_security_group.app1-sg13-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "pt_BR.UTF-8" LANG: "pt" LC_ALL: "pt_BR.UTF-8"
    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    # Configure rsyslog to forward logs to a central logging server
    echo "*.* @@SYSLOG-SERVER-LOG:514" >> /etc/rsyslog.conf
    systemctl restart rsyslog

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
#Create a Launch Template in Osaka with the following attributes:
resource "aws_launch_template" "osaka_LT" {
  provider = aws.osaka
  name_prefix   = "osaka_LT"
  image_id      = "ami-0e577819b2a6cc996"
  instance_type = "t2.micro"
  key_name      = "linuxbox-osaka"
  vpc_security_group_ids = [aws_security_group.app1-sg15-servers.id]

  # iam_instance_profile {
  #   arn = aws_iam_instance_profile.ec2_instance_profile.arn
  # }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    locale: "jp_JP.UTF-8" LANG: "jp" LC_ALL: "jp_JP.UTF-8"

    # Install and configure rsyslog
    yum install -y rsyslog
    systemctl start rsyslog
    systemctl enable rsyslog
    systemctl restart rsyslog

    #move syslog files to S3 bucket
    yum install -y amazon-ssm-agent
    systemctl start amazon-ssm-agent
    systemctl enable amazon-ssm-agent
    aws s3 cp /var/log/messages s3://nippon-syslogs-bucket/ --recursive

  EOF  
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app1-instance-Osaka"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}