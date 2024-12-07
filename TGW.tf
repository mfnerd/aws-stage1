#Create transit gateways to connect each region
resource "aws_ec2_transit_gateway" "transit_gateway" {
  provider = aws.tokyo
  description = "Transit Gateway in Tokyo"
  tags = {
    Name = "Transit Gateway"
  }
}