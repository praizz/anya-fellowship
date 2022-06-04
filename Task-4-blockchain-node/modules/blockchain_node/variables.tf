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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzHVMV5vSGeoCZD9gzdPCpSkJcSH3b62mvZ0ZaQixkHu6SSCFdflA8CF4XKeqV/s4Jl+++8xeThNm8tMUT1nYNXlK0eCYmTZID/B75aI4aThXavzEJAxQTQ+1rl1Iiz8ydnFF/zexLOSonDNOZNbMGJylPPk3Wjgenpa1ezHmiZCNck+41/iNpTsrkel74CPmzuD6HWed4NCCZUnGAyHNAa3bXWBu0Uc6QsjCTFn5GXNg2SC1cgZTWY5Eli/HM1nQjt/xUHqqBgrotGRxoAwvWcUx4nlapCHmoftUw5akH20wnMx+AjovE27wM74fJNdAFtmw5HTRaS4RgVyFgy2v7 derek@Dereks-Air.Dlink"
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
  default = "ami-0e6273fe5a9a1ad93"
}
