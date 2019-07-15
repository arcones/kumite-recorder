module dynamo {
  source = "./dynamo"
}

module lambda {
  source = "./lambda"
}

module apigateway {
  source = "./apigateway"
  lambda_writer_arn = module.lambda.kumite_writer_arn
}

module route53 {
  source = "./route53"
  api-gateway-domain-name = module.apigateway.apigateway_domain_name
  api-gateway-regional-domain-name = module.apigateway.apigateway_regional_domain_name
  api-gateway-regional-zone-id = module.apigateway.apigateway_regional_zone_id
}