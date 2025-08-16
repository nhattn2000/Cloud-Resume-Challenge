variable "region" {
  type        = string
  description = "Primary AWS region for resources"
}

variable "account_id" {
  type = string
  description = "Account ID"
}

variable "domain_name" {
  type        = string
  description = "Root domain (e.g., example.com)"
}

variable "subdomain" {
  type        = string
  description = "Website host (e.g., www)"
}

variable "api_subdomain" {
  type        = string
  description = "API host (e.g., api)"
}

variable "website_dir" {
  type        = string
  description = "Path to your static website files (relative to this folder)"
}

variable "prevent_destroy" {
  type        = bool
  default     = true
}

variable "acm_cert_arn_us_east_1" {
  type        = string
  description = "ACM cert ARN in us-east-1"
}

variable "table_name" {
  type        = string
  description = "Dynamodb table name for View Counter"
}

#lambda

variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "lambda_handler" {
  type        = string
  description = "Handler function for Lambda"
}

variable "lambda_runtime" {
  type        = string
  description = "Runtime environment for Lambda"
}

variable "lambda_filename" {
  type        = string
  description = "Path to Lambda .zip file"
}

variable "lambda_role_arn" {
  type        = string
  description = "IAM role ARN for Lambda"
}