variable "instance_class" {
  type        = string
   #default     = "db.t2.micro"
  description = "The instance type of the RDS instance"
}

variable "allocated_storage" {
  type        = number
  #default     = 20
  description = "The amount of storage to allocate for the RDS instance"
}

variable "engine" {
  type        = string
  default     = "postgres"
  description = "The database engine to use"
}

variable "engine_version" {
  type        = string
  #default     = "13.4"
  description = "The version of the database engine to use"
}

variable "username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "password" {
  type        = string
  description = "The password for the RDS instance"
}

variable "db_name" {
  type        = string
  description = "The name of the database to create"
}

# variable "subnet_ids" {
#   type        = list(string)
#   description = "The IDs of the subnets to deploy the RDS instance in"
# }

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "The IDs of the VPC security groups to assign to the RDS instance"
 }

variable "tags" {
  type        = map(string)
  description = "The tags to assign to the RDS instance"
}
variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot when deleting the DB instance"
  type        = bool
  #default     = false
}

# variable "final_snapshot_identifier" {
#   description = "The name of the final snapshot when deleting the DB instance"
#   type        = string
#   #default     = "true"
# }
# variable "db_instance_identifier" {
#   type        = string
#   description = "This EC2 is to add to the RDS"
# }
# variable "instance_identifier" {
#   type        = string
#   description = "This EC2 is to add to the RDS"
# }
variable "aws_instance_security_group_id" {
  type        = string
  description = "The ID of the security group assigned to the EC2 instance"
}