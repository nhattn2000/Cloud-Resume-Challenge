module "s3" {
  source                      = "../modules/s3"   
  bucket_name                 = var.bucket_name  
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
  tags                        = var.tags
}

module "cloudfront" {
  source                = "../modules/cloudfront"
  acm_cert_arn          = var.acm_cert_arn_us_east_1 
  s3_origin_domain_name = module.s3.bucket_domain_name
  origin_id             = var.origin_id
  aliases               = ["tien-cloud.com", "*.tien-cloud.com"]
  index_doc             = var.index_doc
  tags                  = var.tags
}

module "acm" {
  source        = "../modules/acm"
  providers     = { aws.us_east_1 = aws.us_east_1 }
  domain_name   = var.domain_name
  tags          = var.tags
}

module "dynamodb_table" {
  source     = "../modules/dynamodb_table"
  table_name = var.table_name
  tags       = var.tags
}

module "lambda" {
  source                = "../modules/lambda"
  lambda_function_name  = var.lambda_function_name
  lambda_handler        = var.lambda_handler
  lambda_runtime        = var.lambda_runtime
  lambda_filename       = var.lambda_filename
  lambda_role_arn       = var.lambda_role_arn
  dynamodb_table_name   = module.dynamodb_table.table_name
  dynamodb_table_arn    = module.dynamodb_table.table_arn
  account_id            = var.account_id
  region                = var.region
  tags                  = var.tags
}

