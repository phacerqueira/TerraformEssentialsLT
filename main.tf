provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
  backend "s3" {
    bucket = "terraform-phacerqueira"
    key    = "terraform-state.tfstate"
    region = "us-east-1"
  }
}