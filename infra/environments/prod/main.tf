module "s3" {
  source      = "../modules/s3"   # relative path from prod/ to modules/s3/
  bucket_name = "cloud-resume-tien"  # real existing bucket
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
  website_dir = var.website_dir
  index_doc   = "index.html"
  error_doc   = "index.html"
}

module "cloudfront" {
  source = "../modules/cloudfront"

  acm_cert_arn          = var.acm_cert_arn_us_east_1 
  s3_origin_domain_name = module.s3.bucket_domain_name
  aliases               = ["tien-cloud.com", "*.tien-cloud.com"]
}