variable "region" {
  description = "List of AWS regions where resources will be created"
  type        = list(string)
}
variable "availability_zones" {
  description = "List of availability zones for each region"
  type        = map(list(string))
}
variable "subnets" {
  description = "List of subnets to be created in each region"
  type        = map(list(string))
}

variable "alias" {
  description = "Provider alias"
  type        = map(string)
}

variable "image_id" {
  description = "List of AMI IDs for each region"
  type        = map(string)
}

#Create language variables for the launch template for each region
# variable "locale" {
#   description = "The locale for the launch template"
#   type        = string
# }

# variable "lang" {
#   description = "The language for the launch template"
#   type        = string
# }

# variable "lc_all" {
#   description = "The LC_ALL for the launch template"
#   type        = string
# }

variable "vpc_cidr_blocks" {
  description = "CIDR blocks for VPCs in each region"
  type        = map(string)
}

variable "location" {
  description = "The location for naming resources"
  type        = map(string)  
}
variable "peer_transit_gateway_id_hk" {
  description = "The ID of the peer transit gateway in Hong Kong"
  type        = string
}

variable "peer_transit_gateway_id_au" {
  description = "The ID of the peer transit gateway in Australia"
  type        = string
}
variable "peer_transit_gateway_id_ca" {
  description = "The ID of the peer transit gateway in California"
  type        = string
}
variable "peer_transit_gateway_id_ny" {
  description = "The ID of the peer transit gateway in tNew York"
  type        = string
}
variable "peer_transit_gateway_id_uk" {
  description = "The ID of the peer transit gateway in London"
  type        = string
}
variable "peer_transit_gateway_id_jp" {
  description = "The ID of the peer transit gateway in Japan"
  type        = string
}
variable "peer_transit_gateway_id_br" {
  description = "The ID of the peer transit gateway in Brazil"
  type        = string
}