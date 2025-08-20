resource "aws_apigatewayv2_api" "resume_api" {
  name          = var.api_subdomain
  protocol_type = "HTTP"
  route_selection_expression = "$request.method $request.path"

  cors_configuration {
    allow_credentials = false
    allow_headers     = ["content-type",]
    allow_methods     = ["GET",]
    allow_origins     = ["https://tien-cloud.com", "https://www.tien-cloud.com"]
    expose_headers    = []
    max_age           = 0
  }
}

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id = aws_apigatewayv2_api.resume_api.id
  name   = "$default"
  auto_deploy = true

  default_route_settings {
    data_trace_enabled       = false
    detailed_metrics_enabled = false
    throttling_burst_limit   = 0
    throttling_rate_limit    = 0
  }
}

resource "aws_apigatewayv2_integration" "api_integration" {
  api_id           = aws_apigatewayv2_api.resume_api.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  integration_uri           = var.lambda_function_arn
  payload_format_version    = "2.0"
  timeout_milliseconds      = 30000
}

resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.resume_api.id
  route_key = "GET /"

  target = "integrations/${aws_apigatewayv2_integration.api_integration.id}"
}

resource "aws_apigatewayv2_domain_name" "api_domain" {
  domain_name = var.api_subdomain

  domain_name_configuration {
    certificate_arn = var.acm_cert_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }

  tags = var.tags
}

resource "aws_apigatewayv2_api_mapping" "api_mapping" {
  api_id          = aws_apigatewayv2_api.resume_api.id
  domain_name     = aws_apigatewayv2_domain_name.api_domain.id
  stage           = aws_apigatewayv2_stage.api_stage.id
}