provider aws {
  region = "us-east-1"
  alias = "acm-certs"
  profile = "kumite"
}

resource aws_acm_certificate certificate {
  provider          = "aws.acm-certs"
  domain_name       = "recorder.kumite.xyz"
  validation_method = "DNS"
  tags = {
    Application = "kumite-recorder"
  }
}

resource aws_acm_certificate_validation certificate_validation {
  provider          = "aws.acm-certs"
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [var.route53_fqdn]
  timeouts {
    create = "45m"
  }

}