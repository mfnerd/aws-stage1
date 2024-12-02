# Create S3 bucket for syslog data storage in Tokyo region
resource "aws_s3_bucket" "nippon_syslogs_bucket" {
  bucket = "nippon-syslogs"
  # acl    = "private"

  tags = {
    Name        = "nippon-syslogs"
    Environment = "Production"
    Region      = "ap-northeast-1"
  }
}

# Attach a bucket policy to restrict access to instances in the Tokyo region
resource "aws_s3_bucket_policy" "nippon_syslogs_bucket_policy" {
  bucket = aws_s3_bucket.nippon_syslogs_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Deny"
        Principal = "*"
        Action = "s3:*"
        Resource = [
          "${aws_s3_bucket.nippon_syslogs_bucket.arn}",
          "${aws_s3_bucket.nippon_syslogs_bucket.arn}/*"
        ]
        Condition = {
          StringNotEquals = {
            "aws:RequestedRegion" = "ap-northeast-1"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "ec2_role"
    Environment = "Production"
  }
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  name = "ec2_role_policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = [
          "${aws_s3_bucket.nippon_syslogs_bucket.arn}",
          "${aws_s3_bucket.nippon_syslogs_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name

  tags = {
    Name        = "ec2_instance_profile"
    Environment = "Production"
  }
}
