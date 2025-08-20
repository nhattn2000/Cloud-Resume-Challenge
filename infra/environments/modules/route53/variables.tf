variable "cloudfront_domain_name" {
    type = string
}

variable "apigw_domain_target"{
    type = string
}

variable "apigw_hosted_zone_id"{
    type = string
}

variable "cfn_zone_id" {
    type        = string
    description = "CloudFormation Hosted Zone ID for the custom domain"
    default = "Z2FDTNDATAQYW2"
}

variable "api_subdomain" {
  type        = string
  description = "API host (e.g., api)"
}