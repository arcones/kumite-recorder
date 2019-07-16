resource aws_api_gateway_rest_api kumite_writer_api {
  name = "kumite_writer_api"
}

resource aws_api_gateway_resource proxy {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  parent_id = aws_api_gateway_rest_api.kumite_writer_api.root_resource_id
  path_part = "{proxy+}"
}

resource aws_api_gateway_method proxy {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = "POST"
  authorization = "NONE"
}

resource aws_api_gateway_integration lambda {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  resource_id = aws_api_gateway_method.proxy.resource_id
  http_method = aws_api_gateway_method.proxy.http_method

  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = var.lambda_invoke_arn
}

resource aws_api_gateway_method proxy_root {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  resource_id = aws_api_gateway_rest_api.kumite_writer_api.root_resource_id
  http_method = "POST"
  authorization = "NONE"
}

resource aws_api_gateway_integration lambda_root {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  resource_id = aws_api_gateway_method.proxy_root.resource_id
  http_method = aws_api_gateway_method.proxy_root.http_method

  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = var.lambda_invoke_arn
}

resource aws_api_gateway_deployment deployment {
  depends_on = [
    "aws_api_gateway_integration.lambda",
    "aws_api_gateway_integration.lambda_root",
  ]

  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  stage_name = "v1"
}

resource aws_lambda_permission lambda_permission {
  statement_id = "AllowAPIGatewayInvoke"
  action = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_deployment.deployment.execution_arn}/*/*"
}


//TODO poner order con el lio de guiones bajos, altos y demas!!
//TODO si el yaml al final no hace falta... borrarlo! y hacer limpieza de todo lo demas tb!!!