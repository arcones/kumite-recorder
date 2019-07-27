output apigateway_url {
  value = module.apigateway.apigateway_url
}

output certificate_domain_arn {
  value = module.acm.certificate_domain_arn
}

output domain_validation_options {
  value = module.acm.domain_validation_options
}

output apigateway_domain_name {
  value = module.apigateway.apigateway_domain_name
}

output apigateway_regional_domain_name {
  value = module.apigateway.apigateway_regional_domain_name
}

output apigateway_regional_zone_id {
  value = module.apigateway.apigateway_regional_zone_id
}