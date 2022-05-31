variable "aws_region" {
  description = "The default AWS region"
  default     = "eu-west-1"
}

variable "github_access_token" {
  description = "access token generated from github"
  default     = ""
}

variable "repo_url" {
  description = "the repo url to deploy the self hosted runner to"
  default     = ""
}

variable "ami_name" {
  description = "the name of the ami image to use"
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

variable "ami_owner" {
  description = "the name of the ami image to use"
  default     = ""
}

variable "api_token_registration_url" {
  description = "the api repo url to generate time bound token"
  default     = "https://api.github.com/repos/your_user/your_repository_name/actions/runners/registration-token" #default format
}
