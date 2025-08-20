resource "aws_route53_zone" "custom_zone" {
  name = "tien-cloud.com"
  comment = "HostedZone created by Route53 Registrar"
}

# ACM Validation Record
resource "aws_route53_record" "acm_validation" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = "_5b7e76154189debbe2aca39252f05eb5.tien-cloud.com"
  type    = "CNAME"
  ttl     = 300
  records = ["_f13a99d2d24c82746b947762f6d38352.xlfgrmvvlj.acm-validations.aws."]

}

# A and AAAA for CFN Distribution
resource "aws_route53_record" "apex_a" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = "tien-cloud.com"
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name      # e.g., d1234abcd.cloudfront.net
    zone_id                = var.cfn_zone_id
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "apex_aaaa" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = "tien-cloud.com"
  type    = "AAAA"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cfn_zone_id
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "wildcard_a" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = "*.tien-cloud.com"
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cfn_zone_id
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "wildcard_aaaa" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = "*.tien-cloud.com"
  type    = "AAAA"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cfn_zone_id
    evaluate_target_health = false
  }
}


#Alias A Record for APIGW
resource "aws_route53_record" "api_alias_record" {
  zone_id = aws_route53_zone.custom_zone.zone_id
  name    = var.api_subdomain
  type    = "A"
  alias {
    name                   = var.apigw_domain_target   # e.g., d-abc123.execute-api.us-east-1.amazonaws.com
    zone_id                = var.apigw_hosted_zone_id  # AWS-provided Hosted Zone ID for the custom domain
    evaluate_target_health = false
  }
}

