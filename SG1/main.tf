provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
}#Create a Security Group
resource "aws_security_group" "abc" {
  name        = "example-security-group1"
  description = "Allow inbound SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "aws_security_group_id" {
  value = "aws_security_id"
}
g