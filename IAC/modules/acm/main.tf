provider aws {
  region = "eu-central-1"
  alias = "eu-central-1"
  profile = "kumite"
}

resource aws_acm_certificate certificate {
  provider = "aws.eu-central-1"
  domain_name       = "*.kumite.xyz"
  validation_method = "EMAIL"
  tags = {
    Application = "kumite-recorder"
  }
}
//
//resource aws_acm_certificate_validation certificate_validation {
//  provider = "aws.eu-central-1"
//  certificate_arn         = aws_acm_certificate.certificate.arn
//  validation_record_fqdns = [var.route53_fqdn]
//}