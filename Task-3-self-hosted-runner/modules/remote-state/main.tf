resource "random_id" "remote_state" {
  byte_length = 8
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.name_prefix}-${random_id.remote_state.hex}"
}

data "template_file" "remote_state" {
  template = file("${path.module}/templates/remote-state.tpl")
  vars = {
    bucket_name = aws_s3_bucket.remote_state.id
  }
}

resource "local_file" "remote_state_locks" {
  content  = data.template_file.remote_state.rendered
  filename = var.backend_output_path
}
