#Create attachment for the shared transit gateway in Japan
# resource "aws_vpc_attachment" "tgw-attachment-nyc" {
# provider = "ap-northeast-1"  
# vpc_id = aws_vpc.teledoc-tokyo.id
#   transit_gateway_id = aws_vpc_transit_gateway.tgw-tokyo.id
#