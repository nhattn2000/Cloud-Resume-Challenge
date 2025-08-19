# Create OAC in TF (recommended)
resource "aws_cloudfront_origin_access_control" "resume_cfn" {
  name                              = var.s3_origin_domain_name
  description                       = "OAC for cloud-resume-tien.s3" 
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "resume_cfn" {
  enabled             = true
  default_root_object = var.index_doc
  is_ipv6_enabled     = true

  tags = var.tags

  tags_all = var.tags

  aliases = var.aliases

  origin {
    origin_id                = var.origin_id
    domain_name              = var.s3_origin_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_cfn.id
    connection_attempts      = 3
    connection_timeout       = 10
  }

  default_cache_behavior {
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_cert_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021" 
  }

#Used to ignore minimum_protocol_version Terraform does not support TLSv1.3 yet
  lifecycle {
    prevent_destroy = true
    ignore_changes  = [
      viewer_certificate[0].minimum_protocol_version
    ]
  }
}

