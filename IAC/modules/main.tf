module dynamo {
  source = "./dynamo"
}

module lambda {
  source = "./lambda"
  apigateway_execution_arn = module.apigateway.apigateway_execution_arn
}

module apigateway {
  source            = "./apigateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  lambda_arn = module.lambda.lambda_arn
  lambda_function_name = module.lambda.lambda_function_name
  certificate_domain_arn = module.acm.certificate_domain_arn
}

module route53 {
  source = "./route53"
  validation_record_name = module.acm.validation_record_name
  validation_record_type = module.acm.validation_record_type
  validation_record_value = module.acm.validation_record_value
  apigateway_domain_name = module.apigateway.apigateway_domain_name
  apigateway_zone_id = module.apigateway.apigateway_zone_id
}

module acm {
  source = "./acm"
  route53_fqdn = module.route53.domain_record_fqdn
}