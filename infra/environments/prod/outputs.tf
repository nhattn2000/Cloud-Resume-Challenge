#S3 Outputs
output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "s3_bucket_domain_name" {
  value = module.s3.bucket_domain_name
}

#CloudFront Outputs

output "distribution_id"  { 
    value = module.cloudfront.distribution_id 
}

output "distribution_arn" { 
    value = module.cloudfront.distribution_arn
}

