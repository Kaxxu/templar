# TERRAFORM CLOUD
#terraform {
#  required_version = "= 1.2.1"
#
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "4.6.0"
#    }
#  }
#
#  backend "remote" {
#    hostname     = "app.terraform.io"
#    organization = var.organization
#  }
#}

terraform {
  required_version = "= 1.2.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.6.0"
    }
  }

  backend "s3" {
    # Configuration see: params/*.backend
    # Commands:
    # terraform init -backend-config=params/templar.backend -reconfigure
    # terraform plan -var-file=params/templar.tfvars
  }
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
