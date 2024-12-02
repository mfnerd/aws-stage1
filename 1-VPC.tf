resource "aws_vpc" "teledoc" {
  provider = var.alias
  cidr_block = var.vpc_cidr_blocks[var.location]

  tags = {
    Name    = "teledoc-${each.key}-vpc"
    Service = "applicationLB"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}