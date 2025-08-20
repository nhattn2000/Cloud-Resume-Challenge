# API basics
output "api_id" {
  value       = aws_apigatewayv2_api.resume_api.id
  description = "The ID of the HTTP API"
}
output "api_endpoint" {
  value       = aws_apigatewayv2_api.resume_api.api_endpoint
  description = "The invoke URL for the HTTP API"
}
output "execution_arn" {
  value       = aws_apigatewayv2_api.resume_api.execution_arn
  description = "Execution ARN for use in Lambda permissions"
}



# Stage
output "stage_name" {
  value       = aws_apigatewayv2_stage.api_stage.name
  description = "The stage name of the API Gateway"
}



# Integration / route (useful for debugging or chaining)
output "integration_id" {
  value       = aws_apigatewayv2_integration.api_integration.id
  description = "The ID of the Lambda proxy integration"
}
output "route_id" {
  value       = aws_apigatewayv2_route.api_route.id
  description = "The ID of the API Gateway route"
}



# Custom domain
output "custom_domain_name" {
  value       = aws_apigatewayv2_domain_name.api_domain.domain_name
  description = "The custom domain name for the API Gateway"
}
output "custom_domain_regional_domain_name" {
  value       = aws_apigatewayv2_domain_name.api_domain.domain_name_configuration[0].target_domain_name
  description = "The regional domain name to use as a Route53 alias target"
}
output "custom_domain_hosted_zone_id" {
  value       = aws_apigatewayv2_domain_name.api_domain.domain_name_configuration[0].hosted_zone_id
  description = "The hosted zone ID to use for Route53 alias records"
}
