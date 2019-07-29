provider aws {
  region = "eu-central-1"
  alias = "certs"
  profile = "kumite"
}

resource aws_acm_certificate certificate {
  provider          = "aws.certs"
  domain_name       = "*.kumite.xyz"
  validation_method = "DNS"
  tags = {
    Application = "kumite-recorder"
  }
}

resource aws_acm_certificate_validation certificate_validation {
  provider          = "aws.certs"
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [var.route53_fqdn]
  timeouts {
    create = "45m"
  }

}