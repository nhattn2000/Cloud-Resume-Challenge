output "distribution_id"  { 
    value = aws_cloudfront_distribution.resume_cfn.id  
}

output "distribution_arn" { 
    value = aws_cloudfront_distribution.resume_cfn.arn 
}

output "distribution_domain_name" {
    description = "The domain name corresponding to the distribution"
    value       = aws_cloudfront_distribution.resume_cfn.domain_name
}

output "distribution_hosted_zone_id" {
    description = "The CloudFront hosted zone ID (needed for Route53 alias)"
    value       = aws_cloudfront_distribution.resume_cfn.hosted_zone_id
}