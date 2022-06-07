variable "project_id" {
  default = "my_project"
}

variable "location" {
  default = "eu-west-1"
}

variable "zone" {
  default = "eu-west-1c"
}

variable "machine_type" {
  default = "m4.large"
}

variable "public_key" {
  default = "ssh-rsa PUT KEY HERE"
}

variable "ssh_user" {
  default = ""
}

variable "node_count" {
  default = 1
}

variable "name" {
  default = "node"
}

variable "image" {
  default = "ami-0fe3c508bc62c4a7d"
}
