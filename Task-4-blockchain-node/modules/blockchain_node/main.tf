resource "aws_key_pair" "key-node" {
  key_name   = var.name
  public_key = var.public_key
}

resource "aws_vpc" "main-node" {
  cidr_block = "172.26.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "main-node" {
  cidr_block = "${cidrsubnet(aws_vpc.main-node.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.main-node.id}"
  availability_zone = var.zone
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "main-node" {
  vpc_id = "${aws_vpc.main-node.id}"

  tags = {
    Name = var.name
  }
}

resource "aws_route_table" "main-node" {
  vpc_id = "${aws_vpc.main-node.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-node.id}"
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "main-node" {
  subnet_id      = "${aws_subnet.main-node.id}"
  route_table_id = "${aws_route_table.main-node.id}"
}

resource "aws_security_group" "main-node" {
  name = "externalssh"
  vpc_id = "${aws_vpc.main-node.id}"
}

resource "aws_security_group_rule" "externalssh-name" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "p2p-node" {
  type            = "ingress"
  from_port       = 30333
  to_port         = 30333
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "p2p-proxy-node" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "vpn-node" {
  type            = "ingress"
  from_port       = 51820
  to_port         = 51820
  protocol        = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "node-exporter-node" {
  type            = "ingress"
  from_port       = 9100
  to_port         = 9100
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "node-metrics-node" {
  type            = "ingress"
  from_port       = 9616
  to_port         = 9616
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_security_group_rule" "allow_all-node" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.main-node.id}"
}

resource "aws_instance" "main-node" {
  ami           = var.image
  instance_type = var.machine_type
  key_name      = var.name
  count         = var.node_count

  subnet_id              = "${aws_subnet.main-node.id}"
  vpc_security_group_ids = ["${aws_security_group.main-node.id}"]

  root_block_device {
    volume_size = 150
  }

  tags = {
    Name = "{{var.name}}-${count.index}"
  }
}
