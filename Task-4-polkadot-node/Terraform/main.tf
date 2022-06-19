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
# Key Pair
################################################################################
resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "${local.name}-key-pair"
  public_key = var.public_key #tls_private_key.this.public_key_openssh
}

################################################################################
# IAM ROLE & POLICY FOR DYNAMIC INVENTORY
################################################################################
resource "aws_iam_role" "dynamic_inventory_role" {
  name = "dynamic_inventory_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = local.tags
}

resource "aws_iam_role_policy" "dynamic_inventory_policy" {
  name = "dynamic_inventory_policy"
  role = "${aws_iam_role.dynamic_inventory_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
