data template_file open_api_spec {
  template = file("${path.cwd}/${path.module}/open_api_spec.yaml")

//  vars = {
//    LAMBDA_ARN     = var.lambda_writer_arn
//  }
}

resource aws_api_gateway_rest_api kumite_writer_api {
  name = "kumite_writer_api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  body = data.template_file.open_api_spec.rendered
}

resource aws_api_gateway_stage stage {
  stage_name    = "v1"
  rest_api_id   = aws_api_gateway_rest_api.kumite_writer_api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

resource aws_api_gateway_domain_name domain_name {
  domain_name = "kumiterecorder.net"
  regional_certificate_arn = var.certificate_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource aws_api_gateway_deployment deployment {
  rest_api_id = aws_api_gateway_rest_api.kumite_writer_api.id
  stage_name  = "v1"

  variables = {
    etag = filemd5("${path.cwd}/${path.module}/open_api_spec.yaml")
  }
}

resource aws_api_gateway_stage stage {
  stage_name            = "v1"
  rest_api_id           = aws_api_gateway_rest_api.kumite_writer_api.id
  deployment_id         = aws_api_gateway_deployment.deployment.id
  cache_cluster_enabled = false

  tags = {
    Application = "kumite-recorder"
  }
}

//TODO poner order con el lio de guiones bajos, altos y demas!!