variable "aws_region" {
  description = "aws region to deploy apps to"
  default     = "eu-west-1"
}

variable "db_base_path" {
  default = "anya-polkadot"
}

variable "public_key" {
  description = "The public key material."
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCyWL8r7c2gNyqVpJdvoWevhXID4qIILvIfYBssjhsgV4T2zeWpuzSRY54NFHK1ouOFul6BztK3d1OXnieJAoSdlJtXEEwWPU1dAktg90pKS7/zf/O4w8YrTFEDQa73Cu+5+nVa+NwJMv3jI2QVQ9Gy3BfrLPOz70c5vdvWesihpg3PSpGHtY3IfDwXyIKd/XCK5l0zGSQttZ8Ghi4bwauL7WPHXU4RaSAg3vHf8WcI9702qKoOt/5jntRtzabIzm/DWPrPqXgJgNIJvcqWYQDsoikLXzD4DLpF83Q3MCYL5yY41syAnTajF113vqmaP/ZcgAU24YAl40bLD4OvUND08L0sAGELyZU3oQSnPW4kvSs//FyCxcrvMpQvxss7EX2naXGgArxwmn0UYxT8LJykL1FrdyclaSaq98JNCmTE8Kfu9d7XnTyqG70FPvAMS0hkBSzqTrIIFAPk4bZzxwAe5ro47J50rW929trhU7VJUuRNFnOlnM9+Q/UENlzLRs= praiseogunnowo@Praises-MacBook-Pro.local"
}

