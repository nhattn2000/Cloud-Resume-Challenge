output "distribution_id"  { 
    value = aws_cloudfront_distribution.resume_cfn.id  
}

output "distribution_arn" { 
    value = aws_cloudfront_distribution.resume_cfn.arn 
}
