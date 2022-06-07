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
  access_key = "AKIATLDALSLMX3RUYMP4"
  secret_key = "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"
}
