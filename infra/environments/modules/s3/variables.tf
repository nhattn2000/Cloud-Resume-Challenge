variable "bucket_name"{
    type = string 
    }

variable "website_dir" {
    type = string 
    }    

variable "index_doc"   {
    type = string 
    }

variable "error_doc"   {
    type = string
    }

variable "cloudfront_distribution_arn" {
  type        = string
  description = "CloudFront distribution ARN for OAC SourceArn condition"
}
