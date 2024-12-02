# resource "aws_route_table" "private" {
#   for_each = toset(var.regions)
#   provider = aws[lookup(var.provider, each.key)]
#   vpc_id   = aws_vpc.teledoc[each.key].id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat[each.key].id
#   }

#   tags = {
#     Name = "private-${each.key}"
#   }
# }

# resource "aws_route_table" "public" {
#   for_each = toset(var.regions)
#   provider = aws[lookup(var.provider, each.key)]
#   vpc_id   = aws_vpc.teledoc[each.key].id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw[each.key].id
#   }

#   tags = {
#     Name = "public-${each.key}"
#   }
# }

# resource "aws_route_table_association" "private" {
#   for_each = { for region, azs in var.subnets : region => azs if contains(var.regions, region) }
#   provider = aws[lookup(var.provider, each.key)]
#   subnet_id      = aws_subnet.private[each.key].id
#   route_table_id = aws_route_table.private[each.key].id
# }

# resource "aws_route_table_association" "public" {
#   for_each = { for region, azs in var.subnets : region => azs if contains(var.regions, region) }
#   provider = aws[lookup(var.provider, each.key)]
#   subnet_id      = aws_subnet.public[each.key].id
#   route_table_id = aws_route_table.public[each.key].id
# }
