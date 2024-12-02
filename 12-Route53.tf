data "aws_route53_zone" "mfnerd" {
  name         = "mfnerd.org"  # The domain name you want to look up
  private_zone = false
}

resource "aws_route53_record" "www_tokyo" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "Tokyo"
  geolocation_routing_policy {
    continent = "Asia"
  }
  alias {
    name                   = aws_lb.teledoc-tokyo_alb.dns_name
    zone_id                = aws_lb.teledoc-tokyo_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_nyc" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "New York"
  geolocation_routing_policy {
    continent = "North America"
  }
  alias {
    name                   = aws_lb.teledoc-nyc_alb.dns_name
    zone_id                = aws_lb.teledoc-nyc_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_london" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "London"
  geolocation_routing_policy {
    continent = "Europe"
  }
  alias {
    name                   = aws_lb.teledoc-london_alb.dns_name
    zone_id                = aws_lb.teledoc-london_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_brazil" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "Brazil"
  geolocation_routing_policy {
    continent = "South America"
  }
  alias {
    name                   = aws_lb.teledoc-brazil_alb.dns_name
    zone_id                = aws_lb.teledoc-brazil_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_aussie" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "Australia"
  geolocation_routing_policy {
    continent = "Oceania"
  }
  alias {
    name                   = aws_lb.teledoc-aussie_alb.dns_name
    zone_id                = aws_lb.teledoc-aussie_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_hongkong" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "Hong Kong"
  geolocation_routing_policy {
    country = "CN"
    subdivision = "HK"
  }
  alias {
    name                   = aws_lb.teledoc-hongkong_alb.dns_name
    zone_id                = aws_lb.teledoc-hongkong_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_cali" {
  zone_id = data.aws_route53_zone.mfnerd.zone_id
  name    = "mfnerd.org"
  type    = "A"
  set_identifier = "California"
  geolocation_routing_policy {
    country = "US"
    subdivision = "CA"
  }
  alias {
    name                   = aws_lb.teledoc-cali_alb.dns_name
    zone_id                = aws_lb.teledoc-cali_alb.zone_id
    evaluate_target_health = true
  }
}
