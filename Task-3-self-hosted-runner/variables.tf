variable "github_access_token" {
  description = "access token generated from github"
  default     = ""
}

variable "ami_name" {
  description = "the ami name to use to deploy `ec2"
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

variable "ami_owner" {
  description = "The owner of the public ami (amazon)"
  default     = "099720109477"
}

variable "repo_url" {
  description = "the repo url to deploy the self hosted runner to"
  default     = "https://github.com/praizz/anya-fellowship"
}

variable "api_token_registration_url" {
  description = "the api repo url to generate time bound token"
  default     = "https://api.github.com/repos/praizz/anya-fellowship/actions/runners/registration-token"
}
