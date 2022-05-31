terraform {
  backend "s3" {
    bucket         = "anya-fellowship-runner-terraform-backend"
    key            =  "terraform.tfstate"
  }
}
