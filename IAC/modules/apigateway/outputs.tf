//output apigateway_domain_name {
//  value = aws_api_gateway_domain_name.domain_name.domain_name
//}
//
//output apigateway_regional_domain_name {
//  value = aws_api_gateway_domain_name.domain_name.regional_domain_name
//}
//
//output apigateway_regional_zone_id {
//  value = aws_api_gateway_domain_name.domain_name.regional_zone_id
//}

output apigateway_url {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}"
}