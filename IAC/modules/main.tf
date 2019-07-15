module dynamo {
  source = "./dynamo"
}

module lambda {
  source = "./lambda"
}

module apigateway {
  source            = "./apigateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  lambda_arn = module.lambda.lambda_arn
}