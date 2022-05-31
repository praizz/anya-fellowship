####################### FETCH AMI ###################################
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_name
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = [var.ami_owner] # Canonical
}

####################### SECURITY GROUP ###################################
resource "aws_security_group" "runner_security_group" {
  name = "github_runner"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

####################### EC2 INSTANCE ###################################
resource "aws_instance" "runner_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.runner_security_group.id]

  user_data = templatefile("${path.module}/scripts/startup-script.sh", { github_access_token = var.github_access_token, repo_url = var.repo_url, api_token_registration_url = var.api_token_registration_url })
  tags = {
    Name = "Github-Runner"
    Type = "Terraform"
  }
}


# https://github.com/your_user/your_repository_name/
