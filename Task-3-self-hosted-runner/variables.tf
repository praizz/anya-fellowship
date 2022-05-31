variable "github_access_token"{
  description = "access token generated from github"
  default = ""
}

variable "ami_name"{
  description = "the ami name to use to deploy `ec2"
  default = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

variable "ami_owner" {
  description = "The owner of the public ami (amazon)"
  default     = "099720109477"
}