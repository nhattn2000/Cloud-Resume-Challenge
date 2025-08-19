output "bucket_id" {
    value = aws_s3_bucket.resumebucket.id
}

output "bucket_arn" { 
    value = aws_s3_bucket.resumebucket.arn
}

output "bucket_domain_name" {
    value = aws_s3_bucket.resumebucket.bucket_regional_domain_name
}