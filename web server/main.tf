provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

resource "aws_instance" "web_server" {
  ami           = "ami-0fd05997b4dff7aac" # Replace with a valid Amazon Linux 2 AMI for your region
  instance_type = "t2.micro"

  # Add a key pair (optional, replace with your key name)
  key_name = "Terraform2024" # Replace with your key name if needed

  resource "aws_ebs_volume" "volume_1" {
    availability_zone = aws_instance.web_server.availability_zone
    size              = 10  # Size in GB
    volume_type       = "gp2"  # General Purpose SSD, you can choose others like 'io1' or 'st1'

    tags = {
      Name = "Volume 1"
    }
  }

  # Create the second EBS volume
  resource "aws_ebs_volume" "volume_2" {
    availability_zone = aws_instance.web_server.availability_zone
    size              = 20  # Size in GB
    volume_type       = "gp2"  # General Purpose SSD

    tags = {
      Name = "Volume 2"
    }
  }

  # Security group to allow HTTP access
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  # User data to configure the web server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello, World! This is a web server created by Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer-Terraform"
  }
}

# Security group to allow HTTP access
resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value = aws_instance.web_server.public_ip
}
    output "volume_id_web_server" {

      value = "volume_id.WebServer-Terraform.id"

    }

     output "ami_id" {
      value =  aws_instance.web_server.ami

}

output "aws_security_group" {
  value = aws_security_group.web_server_sg.id
}