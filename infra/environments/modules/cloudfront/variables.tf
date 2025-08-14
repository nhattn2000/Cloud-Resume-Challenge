variable "acm_cert_arn" {
  type        = string
  description = "ACM cert ARN in us-east-1 for tien-cloud.com and *.tien-cloud.com"
}

variable "aliases" {
  type        = list(string)
  description = "CloudFront aliases (CNAMEs)"
  default     = ["tien-cloud.com", "*.tien-cloud.com"]
}

variable "s3_origin_domain_name" {
  type        = string
  description = "S3 REST regional domain name (e.g., bucket.s3.us-east-1.amazonaws.com)"
}
