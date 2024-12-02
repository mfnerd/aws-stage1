terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# provider "aws" {
#   alias = var.alias
#   region = var.region
# }
# provider "aws" {
#   alias  = "nyc"
#   region = "us-east-1"
# }
# provider "aws" {
#   alias  = "london"
#   region = "eu-west-2"
# }
# provider "aws" {
#   alias  = "brazil"
#   region = "sa-east-1"
# }
# provider "aws" {
#   alias  = "aussie"
#   region = "ap-southeast-2"
# }
# provider "aws" {
#   alias  = "hongkong"
#   region = "ap-east-1"
# }
# provider "aws" {
#   alias  = "cali"
#   region = "us-west-1"
# }