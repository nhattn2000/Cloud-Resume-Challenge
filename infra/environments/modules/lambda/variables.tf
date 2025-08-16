variable "lambda_function_name" {
  type        = string
}

variable "lambda_handler" {
  type        = string
}

variable "lambda_runtime" {
  type        = string
}

variable "lambda_filename" {
  type        = string
}

variable "lambda_role_arn" {
  type        = string
  description = "IAM role ARN for Lambda execution"
}

variable "dynamodb_table_name" {
  type        = string
}

variable "dynamodb_table_arn" {
  type        = string
  description = "ARN of the DynamoDB table"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "account_id" {
  type        = string
  description = "Account ID"
}