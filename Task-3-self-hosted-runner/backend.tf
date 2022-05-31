terraform {
  backend "s3" {
    bucket         = "infrastructure-state-bucket"
    key            =  "terraform.tfstate"
  }
}
