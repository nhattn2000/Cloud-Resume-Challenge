#IAM Role for Lambda Execution

resource "aws_iam_role" "lambda_exec" {
  name            = "LambdaViewCounter-Role"
  description     = "Allows Lambda functions to call AWS services on your behalf."

  assume_role_policy = jsonencode({
    Version       = "2012-10-17"
    Statement     = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags      = {
    Project = "Cloud Resume Challenge"
  }

  tags_all  = {
    Project = "Cloud Resume Challenge"
  }
}

#IAM Policy for DynamoDB and Logs

resource "aws_iam_policy" "lambda_policy" {
  name        = "AllowLambdaAccessDynamoDB"
  description = "Allows Lambda access to DynamoDB to GET and UPDATE cloud resume table. Allows logging for lambda to cloudwatch logs"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "dynamodb:UpdateItem",
          "dynamodb:GetItem"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:364777500591:table/cloud-resume"
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.region}:${var.account_id}:log-group:/aws/lambda/*"
      }
    ]
  })

  
  tags      = {
    Project = "Cloud Resume Challenge"
  }

  tags_all  = {
    Project = "Cloud Resume Challenge"
  }

}

# Attach Policy to Role

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

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

  tags = {
    Project = "Cloud Resume Challenge"
  }
}
