terraform {
  backend "s3" {
    bucket         = "anya-fellowship-runner-terraform-backend-d3f9ccbcc873"
    key            =  "terraform.tfstate"
  }
}
