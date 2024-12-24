# modules/ec2/main.tf
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = var.tags

  # Optional configurations
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
}
