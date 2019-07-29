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
  validation_record_name_0 = module.acm.validation_record_name_0
  validation_record_type_0 = module.acm.validation_record_type_0
  validation_record_value_0 = module.acm.validation_record_value_0
  validation_record_name_1 = module.acm.validation_record_name_1
  validation_record_type_1 = module.acm.validation_record_type_1
  validation_record_value_1 = module.acm.validation_record_value_1
  apigateway_domain_name = module.apigateway.apigateway_domain_name
  apigateway_regional_domain_name = module.apigateway.apigateway_regional_domain_name
  apigateway_zone_id = module.apigateway.apigateway_zone_id
}

module acm {
  source = "./acm"
  route53_fqdn = module.route53.domain_record_fqdn
}