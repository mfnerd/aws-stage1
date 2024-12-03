# Create a shared transit gateway in Japan
resource "aws_ec2_transit_gateway" "tgw-tokyo" {
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  description = "Transit Gateway for tokyo"
  dns_support = "enable"
  vpn_ecmp_support = "enable"
  tags = {
    Name    = "tgw-tokyo"
    Service = "application1"
    Owner   = "MFNerd"
    Planet  = "Uranus"
  }
}
