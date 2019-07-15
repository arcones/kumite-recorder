resource aws_acm_certificate certificate {
  domain_name       = "kumiterecorder.net"
  validation_method = "DNS"

  tags = {
    Application = "kumite-recorder"
  }
}