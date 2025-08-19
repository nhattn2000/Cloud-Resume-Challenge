variable "acm_cert_arn" {
  type        = string
  description = "ACM cert ARN in us-east-1 for tien-cloud.com and *.tien-cloud.com"
}

variable "aliases" {
  type        = list(string)
  description = "CloudFront aliases"
  default     = ["tien-cloud.com", "*.tien-cloud.com"]
}

variable "s3_origin_domain_name" {
  type        = string
  description = "S3 REST regional domain name (bucket.s3.us-east-1.amazonaws.com)"
}

variable "origin_id" {
  type = string
}

variable "index_doc"   {
    type = string 
    }

variable "tags" {
  type = map(string)
  description = "Tag for Cloud Resume Project"
}