terraform {
  backend "s3" {
    bucket         = "${bucket_name}"
    key            =  "terraform.tfstate"
    region         = eu-west-1
  }
}
