# Specify the required provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use the appropriate version for your needs
    }
  }
  required_version = ">=1.4.0"
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1" 
}