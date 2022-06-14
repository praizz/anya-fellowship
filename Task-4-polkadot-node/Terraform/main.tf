locals {
  availability_zone = "${local.region}a"
  name              = "anya-polkadot-node"
  region            = var.aws_region
  boot_nodes = ["${local.name}-bootnode-1", "${local.name}-bootnode-2"]
  rpc_nodes = ["${local.name}-rpcnode-1", "${local.name}-rpcnode-2"]

  tags = {
    Terraform = "true"
  }
}
################################################################################
# VPC Module
################################################################################
module "polkadot_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.name}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = local.tags
}

################################################################################
# Security Group Module
################################################################################
# TODO: figure out this security group module
module "polkadot_boot_node_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-sg"
  description = "Security group for use with polkadot EC2 instance"
  vpc_id      = module.polkadot_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"] # TODO: figure out this security group module
  egress_rules        = ["all-all"]

  /* ingress_with_cidr_blocks = [
    {
      from_port   = 30333
      to_port     = 30334
      protocol    = "tcp"
      description = "bootnode ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "ssh"
      cidr_blocks = "0.0.0.0/0"
    },
  ]  */

  tags = local.tags
}

################################################################################
# EC2 Module
################################################################################
resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "${local.name}-key-pair"
  public_key = var.public_key #tls_private_key.this.public_key_openssh
}

module "polkadot_boot_node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(local.boot_nodes)

  name = each.key

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro" #"c5.large"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = true
  vpc_security_group_ids = [module.polkadot_boot_node_security_group.security_group_id]
  subnet_id              = element(module.polkadot_vpc.public_subnets, 0)

 capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
      tags = {
        Name = "my-root-block"
      }
    },
  ]

  tags = local.tags
}

################################################################################
# EBS / Volume attachments
################################################################################
resource "aws_volume_attachment" "boot_node" {
  for_each = module.polkadot_boot_node

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.polkadot_boot_node_ebs[index(local.boot_nodes, each.key)].id
  instance_id =  module.polkadot_boot_node[each.key].id #module.polkadot_boot_node["anya-polkadot-node-bootnode-2"]
}

resource "aws_ebs_volume" "polkadot_boot_node_ebs" {
  count = length(local.boot_nodes)
  availability_zone = local.availability_zone
  size              = 100

  tags = local.tags
}
