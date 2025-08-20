variable "api_subdomain" {
  type        = string
  description = "API host (e.g., api)"
}
variable "lambda_function_arn" {
  type = string
}

variable "acm_cert_arn" {
  type = string
}

variable "tags" {
  type = map(string)
  description = "Tag for Cloud Resume Project"
}