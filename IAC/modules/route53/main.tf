resource aws_route53_zone hosted_zone {
  name = "recorder.kumite.xyz"
}

resource aws_route53_record domain_record {
  zone_id = aws_route53_zone.hosted_zone.id
  name    = var.apigateway_domain_name
  type    = "A"

  alias {
    name                   = var.apigateway_regional_domain_name
    zone_id                = var.apigateway_regional_zone_id
    evaluate_target_health = false
  }
}