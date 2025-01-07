# modules/ec2/outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.ec2.private_ip
}
# output "ebs_volume_id" {
#   value = aws_ebs_volume.example_volume.id
# }

output "ebs_snapshot_id" {
  value = aws_ebs_snapshot.volume_snapshot.id
 }