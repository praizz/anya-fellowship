terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
