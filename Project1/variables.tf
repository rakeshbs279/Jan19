# variables.tf
variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance"
  type        = string
  default     = null
}

variable "volume_size" {
  description = "Size of the root volume"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Type of the root volume"
  type        = string
  default     = "gp2"
}

variable "tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
  default     = {}
}
# variable "availability_zone" {
#   description = "The availability zone for the volume."
# }
#
variable "existing_volume_size" {
  description = "Size of the existing EBS volume in GiB."
}

variable "existing_volume_type" {
  description = "Type of the existing EBS volume (e.g., gp2, gp3)."
}

variable "existing_volume_name" {
  description = "Name tag for the existing EBS volume."
}

variable "device_name" {
  description = "The device name to expose to the instance (e.g., /dev/xvdf)."
}

variable "snapshot_name" {
  description = "Name tag for the snapshot."
}