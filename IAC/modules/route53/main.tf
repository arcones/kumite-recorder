resource aws_route53_zone hosted_zone {
  name = "kumite.xyz"
}

resource aws_route53_record domain_record {
  zone_id = aws_route53_zone.hosted_zone.id
  name = var.apigateway_regional_domain_name
  type = "A"

  alias {
    name = var.apigateway_regional_domain_name
    zone_id = var.apigateway_zone_id
    evaluate_target_health = false
  }
}

resource aws_route53_record certificate_validation_0 {
  name = var.validation_record_name_0
  type = var.validation_record_type_0
  zone_id = aws_route53_zone.hosted_zone.zone_id
  records = [
    var.validation_record_value_0]
  ttl = 60
}

resource aws_route53_record certificate_validation_1 {
  name = var.validation_record_name_1
  type = var.validation_record_type_1
  zone_id = aws_route53_zone.hosted_zone.zone_id
  records = [
    var.validation_record_value_1]
  ttl = 60
}
