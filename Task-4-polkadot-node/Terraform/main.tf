locals {
  availability_zone = "${local.region}a"
  name              = "anya-polkadot-node"
  region            = var.aws_region
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
module "polkadot_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-sg"
  description = "Security group for use with polkadot EC2 instance"
  vpc_id      = module.polkadot_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

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
  public_key = tls_private_key.this.public_key_openssh
}

module "polkadot_node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${local.name}"

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro" #"c5.large"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = true
  vpc_security_group_ids = [module.polkadot_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = local.tags
}

################################################################################
# EBS / Volume attachments
################################################################################
resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.polkadot_ebs.id
  instance_id = module.polkadot_node.id
}

resource "aws_ebs_volume" "polkadot_ebs" {
  availability_zone = local.availability_zone
  size              = 10

  tags = local.tags
}


