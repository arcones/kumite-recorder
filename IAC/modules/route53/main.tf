resource aws_route53_zone hosted_zone {
  name = "recorder.kumite.xyz"
}

resource aws_route53_record domain_record {
  zone_id = aws_route53_zone.hosted_zone.id
  name    = var.apigateway_domain_name
  type    = "A"

  alias {
    name                   = var.apigateway_domain_name
    zone_id                = var.apigateway_zone_id
    evaluate_target_health = false
  }
}

resource aws_route53_record certificate_validation {
  name    = var.validation_record_name
  type    = var.validation_record_type
  zone_id = aws_route53_zone.hosted_zone.zone_id
  records = [var.validation_record_value]
  ttl     = 60
}
