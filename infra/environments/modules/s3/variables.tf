variable "bucket_name"{
    type = string 
    }

variable "cloudfront_distribution_arn" {
  type        = string
  description = "CloudFront distribution ARN for OAC SourceArn condition"
}

variable "tags" {
  type = map(string)
  description = "Tag for Cloud Resume Project"
}