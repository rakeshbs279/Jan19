# modules/ec2/0.tf
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
#
# resource "aws_volume_attachment" "attach_volume" {
#   device_name = var.device_name
#   volume_id   = aws_ebs_volume.example_volume.id
#   instance_id = aws_instance.ec2.id
# }

#

# resource "aws_ebs_volume" "example_volume" {
#   availability_zone = var.availability_zone
 #  size              = var.exiting_volume_size
#volume_type       = var.exiting_volume_type
 #  tags = {
  #   Name = var.existing_volume_name
   # # Name = var.existing_volume_id
 #  }
 #}
resource "aws_ebs_snapshot" "volume_snapshot" {
  #existingname = var.existing_volume_name
  #existing_volume = var.existing_volume_name1
  volume_id = var.existing_volume_name
  tags = {
    Name = var.snapshot_name
  }
}
