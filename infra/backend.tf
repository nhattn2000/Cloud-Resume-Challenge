terraform {
  backend "s3" {
    bucket         = "tien-terraform-bucket"       # Replace with your S3 bucket name
    key            = "terraform.tfstate" # Replace with desired state file path in bucket
    region         = "us-east-1"                # Replace with your AWS region, e.g. "us-east-1"
    dynamodb_table = "terraform-state"
    encrypt = true
  }
}