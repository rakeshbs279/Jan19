# terraform.tfvars
region          = "ap-south-1"
ami             = "ami-0fd05997b4dff7aac"
instance_type   = "t2.micro"
key_name        = "Terraform2024"
security_groups = ["sg-03ff24b7c46b7994a"]
#subnet_id       = "subnet-01755b08d812f68f6"
tags = {
  Name = "My-EC2-Instance"
}
