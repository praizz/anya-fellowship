output "ip_address" {
  value = "${aws_instance.main-node.*.public_ip}"
}
