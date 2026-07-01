terraform {
  cloud {
    organization = "Korum"
    workspaces {
      name = "Korum"
    }
  }
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = var.role_arn
    session_name = "terraform_session"
  }

  default_tags {
    tags = {
      Project = local.project_name
    }
  }
}
