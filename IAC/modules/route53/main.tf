resource aws_route53_record domain_record {
  zone_id = "Z1JZV5ND0CYG2K"
  name    = var.api-gateway-domain-name
  type    = "A"

  alias {
    name                   = var.api-gateway-regional-domain-name
    zone_id                = var.api-gateway-regional-zone-id
    evaluate_target_health = false
  }
}