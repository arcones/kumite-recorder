module dynamo {
  source = "./dynamo"
}

module lambda {
  source = "./lambda"
  //  region                     = "${var.region}"
  //  rds-outputs                = "${module.rds.output}"
  //  apigateway-general-outputs = "${module.apigateway.general-output}"
}

module apigateway {
  source = "./apigateway"
  lambda_writer_arn = module.lambda.kumite_writer_arn
}

module route53 {
  source                      = "./route53"
  api-gateway-domain-name = module.apigateway.apigateway_domain_name
}