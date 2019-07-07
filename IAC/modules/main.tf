module dynamo {
  source          = "./dynamo"
}

//module lambda {
//  source                     = "./lambda"
//  region                     = "${var.region}"
//  rds-outputs                = "${module.rds.output}"
//  apigateway-general-outputs = "${module.apigateway.general-output}"
//}
//
//module apigateway {
//  source                  = "./apigateway"
//  lambda_get_tracking_arn = "${module.lambda.lambda_get_tracking_arn}"
//}
//
//module route53 {
//  source                      = "./route53"
//  api-gateway-general-outputs = "${module.apigateway.general-output}"
//}