variable "region" {
  description = "List of AWS regions where resources will be created"
  type        = string
}

variable "subnet" {
  description = "List of subnets to be created in each region"
  type        = map(list(string))
}

variable "alias" {
  description = "List of providers for each region"
  type        = map(string)
}

variable "image_id" {
  description = "List of AMI IDs for each region"
  type        = map(string)
}

variable "domain_name" {
  description = "The domain name for the Route 53 zone"
  type        = string
  default     = "mfnerd.org"
}
#Create language variables for the launch template for each region
variable "locale" {
  description = "The locale for the launch template"
  type        = string
}

variable "lang" {
  description = "The language for the launch template"
  type        = string
}

variable "lc_all" {
  description = "The LC_ALL for the launch template"
  type        = string
}

variable "vpc_cidr_blocks" {
  description = "CIDR blocks for VPCs in each region"
  type        = map(string)
}

variable "location" {
  description = "The location for naming resources"
  type        = string  
}