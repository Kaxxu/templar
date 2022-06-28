terraform {
  required_version = "= 1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.6.0"
    }
  }

  # Terraform S3 backend
  backend "s3" {
    encrypt = true
    bucket  = "terraform-state-kaxxu"
    region  = "eu-west-1"
  }

  # Terraform Cloud backend
  #  backend "remote" {
  #    hostname     = "app.terraform.io"
  #    organization = var.organization
  #  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Name        = local.product
      Environment = var.environment
      Client      = var.client
      Service     = var.service
      Repo        = "Kaxxu/templar"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.name}-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
