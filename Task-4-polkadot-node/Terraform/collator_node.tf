################################################################################
# Security Group Module
################################################################################
module "polkadot_collator_node_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-sg"
  description = "Security group for use with polkadot EC2 instance"
  vpc_id      = module.polkadot_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.tags
}
################################################################################
# EC2 Module
################################################################################
module "polkadot_collator_node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${local.name}-collatornode"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro" #"c5.large"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = true
  vpc_security_group_ids = [module.polkadot_collator_node_security_group.security_group_id]
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
resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.polkadot_collator_node_ebs.id
  instance_id =  module.polkadot_collator_node.id 
}

resource "aws_ebs_volume" "polkadot_collator_node_ebs" {
  availability_zone = local.availability_zone
  size              = 100

  tags = local.tags
}
