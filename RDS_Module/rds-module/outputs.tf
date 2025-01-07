# File: modules/rds/outputs.tf

output "db_instance_address" {
  value       = aws_db_instance.this.address
  description = "The address of the RDS instance"
}

output "db_instance_arn" {
  value       = aws_db_instance.this.arn
  description = "The ARN of the RDS instance"
}

output "db_instance_id" {
  value       = aws_db_instance.this.id
  description = "The ID of the RDS instance"
}