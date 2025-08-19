#S3 Outputs
output "s3_bucket_id" {
  value = module.s3.bucket_id
}
output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
output "s3_bucket_domain_name" {
  value = module.s3.bucket_domain_name
}


#CloudFront Outputs
output "distribution_id"  { 
    value = module.cloudfront.distribution_id 
}
output "distribution_arn" { 
    value = module.cloudfront.distribution_arn
}


#ACM Outputs
output "cert_arn" {
  description = "ARN of the ACM certificate"
  value       = module.acm.cert_arn
}
output "cert_domain_name" {
  description = "Primary domain name of the certificate"
  value       = module.acm.cert_domain_name
}
output "cert_sans" {
  description = "Subject Alternative Names on the certificate"
  value       = module.acm.cert_sans
}


#DynamoDB Outputs
output "table_name" {
  value = module.dynamodb_table.table_name
}
output "table_arn" {
  value = module.dynamodb_table.table_arn
}


#Lambda Outputs
output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}
output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}
output "lambda_invoke_arn" {
  value = module.lambda.lambda_invoke_arn
}
