terraform {
  required_version = "= 1.2.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.6.0"
    }
  }

  # Terraform s3 backend
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
