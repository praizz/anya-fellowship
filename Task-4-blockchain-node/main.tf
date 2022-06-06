module "blockchain_node" {
  source    = "./modules/blockchain_node"
}


module "remote-state-locking" {
  source              = "./modules/remote_state"
  name_prefix          = "anya-fellowship-blockchain node"
  backend_output_path = "./backend.tf"
}
