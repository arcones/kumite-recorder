provider aws {
  region = "us-east-1"
  alias = "us-east-1"
  profile = "kumite"
}


resource aws_acm_certificate certificate {
  domain_name       = "kumite.xyz"
  validation_method = "DNS"
}

resource aws_acm_certificate_validation certificate_validation {
  provider = "aws.us-east-1"
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [var.route53_fqdn]
}