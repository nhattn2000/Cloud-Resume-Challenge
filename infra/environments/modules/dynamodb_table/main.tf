resource "aws_dynamodb_table" "resume_table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"

  attribute {
    name = "ID"
    type = "S"
  }

  tags = {
    Project = "Cloud Resume Challenge"
  }
    
}