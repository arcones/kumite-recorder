output apigateway_url {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

output apigateway_execution_arn {
  value = aws_api_gateway_rest_api.kumite_writer_api.execution_arn
}