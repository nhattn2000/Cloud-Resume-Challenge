# modules/s3/main.tf  (relative: infra/environments/modules/s3/main.tf)

resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
   tags = {
    Project = "Cloud Resume Challenge"
  }
}

resource "aws_s3_bucket_public_access_block" "pab" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "own" {
  bucket = aws_s3_bucket.site.id
  rule { object_ownership = "BucketOwnerEnforced" } 
}
