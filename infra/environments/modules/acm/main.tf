terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      configuration_aliases = [ aws.us_east_1 ]
    }
  }
}


resource "aws_acm_certificate" "resume_acm" {
    provider                  = aws.us_east_1
    domain_name               = "*.${var.domain_name}"
    subject_alternative_names = [
        "*.${var.domain_name}",
        var.domain_name
    ]

    validation_method = "DNS"

    tags = var.tags

    lifecycle {
      prevent_destroy = true
    }
}

