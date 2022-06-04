module "remote-state-locking" {
  source              = "./modules/remote-state"
  name_prefix         = "anya-fellowship-runner"
  backend_output_path = "./backend.tf"
}
