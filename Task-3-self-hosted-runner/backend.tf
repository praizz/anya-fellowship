terraform {
  backend "s3" {
    bucket         = "terraform-backend"
    key            =  "terraform.tfstate"
  }
}
