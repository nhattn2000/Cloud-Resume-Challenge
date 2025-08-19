#Lambda Function
locals {
  lambda_zip_abs = abspath("${path.module}/${var.lambda_filename}")
}

resource "aws_lambda_function" "resume_lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = local.lambda_zip_abs
  role          = var.lambda_role_arn

  source_code_hash = filebase64sha256(local.lambda_zip_abs)

  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}
