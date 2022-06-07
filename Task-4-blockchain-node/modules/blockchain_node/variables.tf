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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjuZ1mZSKroIk+Asrg0BT74xf9TrdKtpv3mhO3kiRGzaKYZZ8Ti79FhLfG1xoGbSrj97UfRxj+U9F4QdbsKfJGwBhbr1xvST3fVOW2segMPNhkFU6HH6FyXPfCDJwClyzoYbMzbSdcWdtmj9SGExP3sSWOQj1kLSKThXHeeUmNzQ7v0RRWXqpbaw/HrZ9sksPqqmzc7/Tp/4XnXBvnPDfFhqZfyvJ/DMtjYwVne5uUvVVA9aa9U68se8kOMH+3eCIGNnmW6rGJPdVZ1H+OXLYgS7SmV/hSbfntdfiGx5yx+rc1es7HmxsF/Pve9Pty9/YV4upetyOrdX+9cQfOlMx0bxEg+KhPl9RUWuqrZhRhGA0veF0DKXxyjH4ulhAcyKhCbFTVSazmvgx7gnFOb/IXBOaE59G9X5udnnn2uMWLRpnUi+E9QF9nl2Q7LFk8EldTuTlYBs8u1PiWYwYGkBaZv8dBTrYoQdSquFg/nqGpTSRZNjYdS29irGdpo5VAK8c= derek@Dereks-MacBook-Air.local"
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
