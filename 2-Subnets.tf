resource "aws_subnet" "public" {
  for_each = { for region, azs in var.subnet : region => azs if contains(var.region, region) }
  # provider = aws[lookup(var.alias, each.key)]
  vpc_id   = aws_vpc.teledoc[each.key].id
  cidr_block = "10.${index(var.region, each.key) + 181}.1.0/24"
  availability_zone = each.value[0]
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-${each.key}-${each.value[0]}"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}

resource "aws_subnet" "private" {
  for_each = { for region, azs in var.subnet : region => azs if contains(var.region, region) }
  # provider = aws[lookup(var.alias, each.key)]
  vpc_id   = aws_vpc.teledoc[each.key].id
  cidr_block = "10.${index(var.region, each.key) + 181}.11.0/24"
  availability_zone = each.value[1]
  map_public_ip_on_launch = false

  tags = {
    Name    = "private-${each.key}-${each.value[1]}"
    Service = "teledoc-app1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}