
module "self-hosted-runner" {
  source              = "./modules/self-hosted-runner"
  github_access_token = var.github_access_token #passed from github actions
  repo_url            = "https://github.com/praizz/anya-fellowship"
  ami_name            = var.ami_name
  ami_owner           = var.ami_owner # canonical amazon amis
}


