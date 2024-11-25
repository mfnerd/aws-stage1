#Create a launch template for each region
resource "aws_launch_template" "app1_tokyo_LT" {
  name_prefix   = "app1_tokyo_LT"
  image_id      = "ami-023ff3d4ab11b2525"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_tokyo_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_nyc_LT" {
  name_prefix   = "app1_nyc_LT"
  image_id      = "ami-0453ec754f44f9a4a"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_nyc_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_london_LT" {
  name_prefix   = "app1_london_LT"
  image_id      = "ami-0c76bd4bd302b30ec"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_london_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_brazil_LT" {
  name_prefix   = "app1_brazil_LT"
  image_id      = "ami-0c820c196a818d66a"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_brazil_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_aussie_LT" {
  name_prefix   = "app1_aussie_LT"
  image_id      = "ami-0146fc9ad419e2cfd"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_aussie_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_hk_LT" {
  name_prefix   = "app1_hk_LT"
  image_id      = "ami-06f707739f2271995"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_hk_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app1_cali_LT" {
  name_prefix   = "app1_cali_LT"
  image_id      = "ami-038bba9a164eb3dc1"  
  instance_type = "t2.micro"

  key_name = "linuxbox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Install and configure the CloudWatch agent
    yum install -y amazon-cloudwatch-agent
    cat <<-CWAGENTCONFIG > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    {
      "agent": {
      "metrics_collection_interval": 60,
      "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
      },
      "logs": {
      "logs_collected": {
        "files": {
        "collect_list": [
          {
          "file_path": "/var/log/messages",
          "log_group_name": "syslog",
          "log_stream_name": "{instance_id}"
          }
        ]
        }
      }
      }
    }
    CWAGENTCONFIG

    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s

    # Install AWS CLI
    yum install -y aws-cli

    # Configure log rotation
    cat <<-LOGROTATE > /etc/logrotate.d/syslog
    /var/log/messages {
      rotate 7
      daily
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
      sharedscripts
      postrotate
        /usr/bin/systemctl reload rsyslog > /dev/null 2>/dev/null || true
      endscript
    }
    LOGROTATE

    # Create a cron job to sync logs to S3
    echo "0 * * * * root aws s3 sync /var/log/messages s3://nippon-syslogs/syslogs/" > /etc/cron.d/s3-sync
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Lizzo Not Allowed</h1>
    <h1>Please</h1>
    <iframe src="https://giphy.com/embed/anS1ZNfpzXSjm" width="640" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/fat-anS1ZNfpzXSjm">via GIPHY</a></p>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_cali_LT"
      Service = "application1"
      Owner   = "MFNerd"
      Planet  = "Uranus"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
