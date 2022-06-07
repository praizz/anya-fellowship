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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtmnBlrgQsWREDsuVf0jNzDg2K8GY57Xy7y8FY7/F9+zSFM2gqHviPt1kW9Ia//UyfvQFhmf3awkLlR1OIkxzn/a9vSm7++uuK7/FEQOShCF0pm87RCy+0MIkaNBi/MsbnjaLiRXcilpa3Ob+ew0EkSjingJoFt4W9SNek9GATcoKISnOZTNTr761TyA2qTpB6k1W+26EQHAk91IwEPQdy17i11TD0P3ciT6RS7BTRyUcMBn9c8L2Z/Oc9wOA7HefUheHVf8P//NT1GAgxE84B/BfqhzHgaZEQY3fYfYgA7A09dpTVGLgZAhsuQFcICKloJ9duIymLnIBTYYKm+W2p"
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
