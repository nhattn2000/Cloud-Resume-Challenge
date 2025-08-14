module "s3" {
  source      = "../modules/s3"   # relative path from prod/ to modules/s3/
  bucket_name = "cloud-resume-tien"  # real existing bucket
  website_dir = var.website_dir
  index_doc   = "index.html"
  error_doc   = "index.html"
}

