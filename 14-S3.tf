#Create S3 bucket for syslog data storage
resource "aws_s3_bucket" "nippon_syslogs_bucket" {
  bucket = "nippon-syslogs"
  region = "ap-northeast-1"
  tags = {
    Name = "nippon-syslogs"
  }
}
