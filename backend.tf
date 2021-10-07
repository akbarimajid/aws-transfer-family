terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "majid-bucket-tf-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "majid-table-tf-state"
    encrypt        = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}