
output "lb_dns_name_tokyo" {
  value       = aws_lb.teledoc["tokyo"].dns_name
  description = "The DNS name of the Tokyo Load Balancer"
}
output "lb_dns_name_nyc" {
  value       = aws_lb.teledoc["nyc"].dns_name
  description = "The DNS name of the New York Load Balancer"
}
output "lb_dns_name_london" {
  value       = aws_lb.teledoc["london"].dns_name
  description = "The DNS name of the London Load Balancer"
}
output "lb_dns_name_brazil" {
  value       = aws_lb.teledoc["brazil"].dns_name
  description = "The DNS name of the Brazil Load Balancer"
}
output "lb_dns_name_aussie" {
  value       = aws_lb.teledoc["aussie"].dns_name
  description = "The DNS name of the Australia Load Balancer"
}
output "lb_dns_name_hongkong" {
  value       = aws_lb.teledoc["hongkong"].dns_name
  description = "The DNS name of the Hong Kong Load Balancer"
}
output "lb_dns_name_cali" {
  value       = aws_lb.teledoc["cali"].dns_name
  description = "The DNS name of the California Load Balancer"
}
