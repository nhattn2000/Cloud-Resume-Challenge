output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.resume_lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.resume_lambda.arn
}

output "lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function"
  value       = aws_lambda_function.resume_lambda.invoke_arn
}
