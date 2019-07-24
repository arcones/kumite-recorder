resource aws_route53_zone hosted_zone {
  name = "kumite.xyz"
}

resource aws_route53_record domain_record {
  name    = var.domain_validation_options[0].resource_record_name
  type    = var.domain_validation_options[0].resource_record_type
  zone_id = aws_route53_zone.hosted_zone.id
  records = [var.domain_validation_options[0].resource_record_value]
  ttl     = 60
}

provider aws {
  region = "us-east-1"
  alias = "us-east-1"
  profile = "kumite"
}

resource aws_acm_certificate_validation certificate_validation {
  provider = "aws.us-east-1"
  certificate_arn         = var.domain_arn
  validation_record_fqdns = [aws_route53_record.domain_record.fqdn]
}