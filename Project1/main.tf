# main.tf
provider "aws" {
  region = var.region
}

module "EC2_Module" {
  source           = "../GR/EC2_Module"
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  security_groups  = var.security_groups
  subnet_id        = var.subnet_id
  volume_size      = var.volume_size
  volume_type      = var.volume_type
  tags             = var.tags
  # availability_zone       = var.availability_zone
  existing_volume_size  = var.existing_volume_size
  existing_volume_type  = var.existing_volume_type
  existing_volume_name  = var.existing_volume_name
  #existing_volume_id  = var.existing_volume_id
  device_name             = var.device_name
  snapshot_name           = var.snapshot_name
}
