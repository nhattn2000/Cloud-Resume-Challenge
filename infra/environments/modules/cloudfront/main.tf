# Create OAC in TF (recommended)
resource "aws_cloudfront_origin_access_control" "resume_cfn" {
  name                              = "cloud-resume-tien.s3.us-east-1.amazonaws.com"
  description                       = "OAC for cloud-resume-tien.s3" 
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "resume_cfn" {
  enabled             = true
  default_root_object = "index.html"
  is_ipv6_enabled     = true

  tags = {
    Project = "Cloud Resume Challenge"
  } 

  tags_all = {
    Project = "Cloud Resume Challenge"
  }

  aliases = var.aliases

  origin {
    origin_id                = "cloud-resume-tien.s3-website-us-east-1.amazonaws.com-me7esmvhbo6" # from plan
    domain_name              = "cloud-resume-tien.s3.us-east-1.amazonaws.com"
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_cfn.id
    connection_attempts      = 3
    connection_timeout       = 10
  }

  default_cache_behavior {
    target_origin_id       = "cloud-resume-tien.s3-website-us-east-1.amazonaws.com-me7esmvhbo6"
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

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      viewer_certificate[0].minimum_protocol_version
    ]
  }

}

