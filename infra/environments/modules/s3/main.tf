resource "aws_s3_bucket" "resumebucket" {
  bucket = var.bucket_name
  tags   = var.tags

  lifecycle {           
    prevent_destroy = true  #prevents accidental deletion
  }
}

resource "aws_s3_bucket_public_access_block" "resumebucket_pab" {
  bucket                  = aws_s3_bucket.resumebucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "resumebucket_own" {
  bucket = aws_s3_bucket.resumebucket.id
  rule { object_ownership = "BucketOwnerEnforced" } 
}
