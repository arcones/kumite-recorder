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
}