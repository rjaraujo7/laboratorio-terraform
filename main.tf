terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "miprimerbucket" {
  bucket = "mi-laboratorio-tf-ricardo-2026-09-06"

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}