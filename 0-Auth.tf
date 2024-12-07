terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}
provider "aws" {
  alias  = "nyc"
  region = "us-east-1"
}
provider "aws" {
  alias  = "california"
  region = "us-west-1"
}
provider "aws" {
  alias  = "london"
  region = "eu-west-1"
}
provider "aws" {
  alias  = "brazil"
  region = "sa-east-1"
}
provider "aws" {
  alias  = "hongkong"
  region = "ap-southeast-1"
}
provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"
}
