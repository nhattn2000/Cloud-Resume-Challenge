terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.52.0" 
    }
  }
  required_version = ">=1.6.0"
}

# Configure the AWS provider
provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}