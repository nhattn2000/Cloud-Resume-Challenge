variable "region" {
  type        = string
  description = "Primary AWS region for resources"
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

# Safety toggle to protect critical resources
variable "prevent_destroy" {
  type    = bool
  default = true
}

variable "acm_cert_arn_us_east_1" {
  type        = string
  description = "ACM cert ARN in us-east-1"
}
