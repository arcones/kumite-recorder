output apigateway_execution_arn {
  value = aws_api_gateway_rest_api.kumite_writer_api.execution_arn
}

output apigateway_domain_name {
  value = aws_api_gateway_domain_name.domain_name.cloudfront_domain_name
}

output apigateway_zone_id {
  value = aws_api_gateway_domain_name.domain_name.cloudfront_zone_id
}