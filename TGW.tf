#Create transit gateways in Tokyo and NYC
resource "aws_ec2_transit_gateway" "transit_gateway-jp" {
  provider = aws.tokyo
  description = "Transit Gateway in Tokyo"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-nyc" {
  provider = aws.nyc
  description = "Transit Gateway in NYC"
  tags = {
    Name = "Transit Gateway"
  }
}
#Create peering attachments between Tokyo, Hong Kong, Australia, and California
resource "aws_ec2_transit_gateway_peering_attachment" "tgw-jp-hk-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "ap-east-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-hk.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "tgw-jp-hk-attachment"
  }
}
resource "aws_ec2_transit_gateway_peering_attachment" "tgw-jp-au-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "ap-southeast-2"
  peer_transit_gateway_id = "tgw-jp-au-attachment"
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "tgw-jp-au-attachment"
  }
}
resource "aws_ec2_transit_gateway_peering_attachment" "tgw-jp-ca-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "us-west-1"
  peer_transit_gateway_id = "tgw-0a1b2c3d4e5f6g7h8"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "tgw-jp-ca-attachment"
  }
}
#Create peering attachments between NYC, California, London, and Brazil
resource "aws_ec2_transit_gateway_peering_attachment" "tgw-nyc-ca-attachment" {
  provider = aws.california
  peer_account_id = "061039804531"
  peer_region = "us-east-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "tgw-nyc-ca-attachment"
  }
}
resource "aws_ec2_transit_gateway_peering_attachment" "tgw-nyc-london-attachment" {
  provider = aws.nyc
  peer_account_id = "061039804531"
  peer_region = "eu-west-2"
  peer_transit_gateway_id = "tgw-nyc-london-attachment"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "tgw-nyc-london-attachment"
  }
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "tgw-nyc-brazil-attachment" {
  provider = aws.nyc
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgw-nyc-brazil.id
  tags = {
    Name = "tgw-nyc-brazil-attachment"
  }
}