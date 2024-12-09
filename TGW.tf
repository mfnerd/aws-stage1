#Create transit gateways in Tokyo, NYC, London, California, Hong Kong, Australia, and Brazil
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
resource "aws_ec2_transit_gateway" "transit_gateway-london" {
  provider = aws.london
  description = "Transit Gateway in London"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-ca" {
  provider = aws.california
  description = "Transit Gateway in California"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-hk" {
  provider = aws.hongkong
  description = "Transit Gateway in Hong Kong"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-au" {
  provider = aws.australia
  description = "Transit Gateway in Australia"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-brazil" {
  provider = aws.brazil
  description = "Transit Gateway in Brazil"
  tags = {
    Name = "Transit Gateway"
  }
}
resource "aws_ec2_transit_gateway" "transit_gateway-osaka" {
  provider = aws.osaka
  description = "Transit Gateway in Osaka"
  tags = {
    Name = "Transit Gateway"
  }
}

# resource "aws_ec2_transit_gateway_route_table_association" "tokyo_route_table_association" {
#   provider = aws.tokyo
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_route_table.id

#   depends_on = [ aws_ec2_transit_gateway_route_table.tokyo_route_table]
# }
# resource "aws_ec2_transit_gateway_route_table_association" "nyc_route_table_association" {
#   provider = aws.nyc
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.nyc_route_table.id

#   depends_on = [ aws_ec2_transit_gateway_route_table.nyc_route_table]
# }
#Create peering accepters for each peering attachment
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ny-accepter" {
  provider                             = aws.nyc
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment.id
    tags = {
    Name = "NewYork-Tokyo-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment]
}
# resource "aws_ec2_transit_gateway_peering_attachment_accepter" "jp-accepter" {
#   provider                             = aws.tokyo
#   transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.ny-jp-attachment.id
  
#   tags = {
#     Name = "NewYork-Tokyo-Peering-Accepter"
#   }
#   depends_on = [aws_ec2_transit_gateway_peering_attachment.ny-jp-attachment]
# }
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "hk-accepter" {
  provider                             = aws.hongkong
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.jp-hk-attachment.id
  tags = {
    Name = "HongKong-Tokyo-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-hk-attachment]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "au-accepter" {
  provider                             = aws.australia
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.jp-au-attachment.id
  tags = {
    Name = "Australia-Tokyo-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-au-attachment]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "brazil-accepter" {
  provider                             = aws.brazil
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.nyc-brazil-attachment.id
  tags = {
    Name = "Brazil-NYC-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-brazil-attachment]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "london-accepter" {
  provider                             = aws.london
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.nyc-london-attachment.id
  tags = {
    Name = "London-NYC-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-london-attachment]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ca-accepter" {
  provider                             = aws.california
  transit_gateway_attachment_id        = aws_ec2_transit_gateway_peering_attachment.nyc-ca-attachment.id
  tags = {
    Name = "California-NYC-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-ca-attachment]
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "osaka-accepter" {
  provider                             = aws.osaka
  transit_gateway_attachment_id       = aws_ec2_transit_gateway_peering_attachment.jp-osaka-attachment.id
  tags = {
    Name = "Osaka-Tokyo-Peering-Accepter"
  }
  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-osaka-attachment]
}
#Create transit gateway vpc attachments in Tokyo, NYC, London, California, Hong Kong, Australia, and Brazil
resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_vpc_attachment" {
  provider = aws.tokyo
  subnet_ids = [aws_subnet.private-ap-northeast-1c.id, aws_subnet.private-ap-northeast-1d.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  vpc_id = aws_vpc.teledoc-tokyo.id
  tags = {
    Name = "Tokyo Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-ap-northeast-1c]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "nyc_vpc_attachment" {
  provider = aws.nyc
  subnet_ids = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  vpc_id = aws_vpc.teledoc-nyc.id
  tags = {  
    Name = "NYC Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-us-east-1a]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "london_vpc_attachment" {
  provider = aws.london
  subnet_ids = [aws_subnet.private-eu-west-2a.id, aws_subnet.private-eu-west-2b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-london.id
  vpc_id = aws_vpc.teledoc-london.id
  tags = {
    Name = "London Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-eu-west-2a]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "california_vpc_attachment" {
  provider = aws.california
  subnet_ids = [aws_subnet.private-us-west-1b.id, aws_subnet.private-us-west-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-ca.id
  vpc_id = aws_vpc.teledoc-california.id
  tags = {
    Name = "California Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-us-west-1b]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "hongkong_vpc_attachment" {
  provider = aws.hongkong
  subnet_ids = [aws_subnet.private-ap-east-1a.id, aws_subnet.private-ap-east-1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-hk.id
  vpc_id = aws_vpc.teledoc-hongkong.id
  tags = {
    Name = "Hong Kong Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-ap-east-1a]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "australia_vpc_attachment" {
  provider = aws.australia
  subnet_ids = [aws_subnet.private-ap-southeast-2a.id, aws_subnet.private-ap-southeast-2b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-au.id
  vpc_id = aws_vpc.teledoc-australia.id
  tags = {
    Name = "Australia Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-ap-southeast-2a]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "brazil_vpc_attachment" {
  provider = aws.brazil
  subnet_ids = [aws_subnet.private-sa-east-1a.id, aws_subnet.private-sa-east-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-brazil.id
  vpc_id = aws_vpc.teledoc-brazil.id
  tags = {
    Name = "Brazil Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-sa-east-1a]
}
resource "aws_ec2_transit_gateway_vpc_attachment" "osaka_vpc_attachment" {
  provider = aws.osaka
  subnet_ids = [aws_subnet.private-ap-northeast-3a.id, aws_subnet.private-ap-northeast-3b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-osaka.id
  vpc_id = aws_vpc.teledoc-osaka.id
  tags = {
    Name = "Osaka Transit Gateway VPC Attachment"
  }
  depends_on = [aws_subnet.private-ap-northeast-3a]
}

#Create peering attachments between Tokyo, Hong Kong, Australia, and California
resource "aws_ec2_transit_gateway_peering_attachment" "jp-hk-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "ap-east-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-hk.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "jp-hk-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-jp] 
}
resource "aws_ec2_transit_gateway_peering_attachment" "jp-au-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "ap-southeast-2"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-au.id
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "jp-au-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-jp] 

}
resource "aws_ec2_transit_gateway_peering_attachment" "jp-ny-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "us-east-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "jp-ny-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-jp] 

}
#Create peering attachments between NYC, California, London, and Brazil
resource "aws_ec2_transit_gateway_peering_attachment" "nyc-ca-attachment" {
  provider = aws.nyc
  peer_account_id = "061039804531"
  peer_region = "us-west-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-ca.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "nyc-ca-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-nyc]
}
resource "aws_ec2_transit_gateway_peering_attachment" "nyc-london-attachment" {
  provider = aws.nyc
  peer_account_id = "061039804531"
  peer_region = "eu-west-2"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-london.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "nyc-london-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-nyc]

}
resource "aws_ec2_transit_gateway_peering_attachment" "nyc-brazil-attachment" {
  provider = aws.nyc
  peer_account_id = "061039804531"
  peer_region = "sa-east-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-brazil.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "nyc-brazil-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-nyc]

}
resource "aws_ec2_transit_gateway_peering_attachment" "jp-osaka-attachment" {
  provider = aws.tokyo
  peer_account_id = "061039804531"
  peer_region = "ap-northeast-3"
  peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-osaka.id
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "jp-osaka-attachment"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-jp]

}
# resource "aws_ec2_transit_gateway_peering_attachment" "ny-jp-attachment" {
#   provider = aws.nyc
#   peer_account_id = "061039804531"
#   peer_region = "ap-northeast-1"
#   peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
#   transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
#   tags = {
#     Name = "ny-jp-attachment"
#   }
#   depends_on = [ aws_ec2_transit_gateway.transit_gateway-nyc]

# }
#Create transit gateway route tables in Tokyo and NYC
resource "aws_ec2_transit_gateway_route_table" "nyc_route_table" {
  provider = aws.nyc
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-nyc.id
  tags = {
    Name = "NYC-Route-Table"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-nyc]
}
resource "aws_ec2_transit_gateway_route_table" "tokyo_route_table" {
  provider = aws.tokyo
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway-jp.id
  tags = {
    Name = "Tokyo-Route-Table"
  }
  depends_on = [ aws_ec2_transit_gateway.transit_gateway-jp]
}
# Add transit gateway route from Tokyo to Hong Kong
resource "aws_ec2_transit_gateway_route" "jp_to_hk" {
  provider = aws.tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_route_table.id
  destination_cidr_block = "10.185.0.0/16"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-hk-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-hk-attachment]
}
# Add transit gateway route from Tokyo to Australia
resource "aws_ec2_transit_gateway_route" "jp_to_au" {
  provider = aws.tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_route_table.id
  destination_cidr_block = "10.186.0.0/16"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-au-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-au-attachment]
}
# Add transit gateway route from Tokyo to NYC
resource "aws_ec2_transit_gateway_route" "jp_to_nyc" {
  provider = aws.tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_route_table.id
  destination_cidr_block = "10.182.0.0/16"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-ny-attachment] 
}
# Add transit gateway route from NYC to California
resource "aws_ec2_transit_gateway_route" "nyc_to_california" {
  provider = aws.nyc
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.nyc_route_table.id
  destination_cidr_block = "10.184.0.0/16"  
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.nyc-ca-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-ca-attachment]
}
# Add transit gateway route from NYC to London
resource "aws_ec2_transit_gateway_route" "nyc_to_london" {
  provider = aws.nyc
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.nyc_route_table.id
  destination_cidr_block = "10.183.0.0/16"  
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.nyc-london-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-london-attachment]
}
# Add transit gateway route to Brazil VPC
resource "aws_ec2_transit_gateway_route" "nyc_to_brazil" {
  provider = aws.nyc
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.nyc_route_table.id
  destination_cidr_block = "10.187.0.0/16"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.nyc-brazil-attachment.id
  
  depends_on = [aws_ec2_transit_gateway_peering_attachment.nyc-brazil-attachment]
}
# Add transit gateway route to Osaka VPC
resource "aws_ec2_transit_gateway_route" "jp_to_osaka" {
  provider = aws.tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_route_table.id
  destination_cidr_block = "10.188.0.0/16"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.jp-osaka-attachment.id

  depends_on = [aws_ec2_transit_gateway_peering_attachment.jp-osaka-attachment]
}
# #Add transit gateway route to Tokyo VPC
# resource "aws_ec2_transit_gateway_route" "ny_to_jp" {
#   provider = aws.nyc
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.nyc_route_table.id
#   destination_cidr_block = "10.181.0.0/16"
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ny-jp-attachment.id

#   depends_on = [aws_ec2_transit_gateway_peering_attachment.ny-jp-attachment]
# }