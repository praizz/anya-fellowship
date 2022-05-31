
module "self-hosted-runner" {
  source                     = "./modules/self-hosted-runner"
  github_access_token        = var.github_access_token #passed from github actions
  repo_url                   = var.repo_url
  api_token_registration_url = var.api_token_registration_url
  ami_name                   = var.ami_name
  ami_owner                  = var.ami_owner # canonical amazon amis
}

####################### REMOTE STATE ###################################

module "remote-state-locking" {
  source              = "./modules/remote-state"
  name_prefix         = "anya-fellowship-runner"
  backend_output_path = "./backend.tf"
}
