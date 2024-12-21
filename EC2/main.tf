#module "ec2"
#source = "Dec7"

provider "aws" {

  region = "ap-south-1"
  alias = "ap-south-1"
}

provider "aws" {
  region = "ap-southeast-1"
  alias = "ap-southeast-1"
}
provider "aws"{

  region = "ap-southeast-2"
  alias = "ap-southeast-2"
}

resource "aws_instance" "mumbai" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  provider = aws.ap-south-1
  security_groups = ["example-security-group1"]
  tags = {
    Name = "mumbai vm"
  }
}
resource "aws_instance" "singapore" {
  ami           = "ami-0f935a2ecd3a7bd5c"
  instance_type = "t2.micro"
  provider = aws.ap-southeast-1
  #security_groups = ["example-security-group1"]
  tags = {
    Name = "singapore vm"
  }
}
resource "aws_instance" "sydney1" {
  ami           = "ami-0146fc9ad419e2cfd"
  instance_type = "t2.micro"
  provider = aws.ap-southeast-2
  #security_groups = ["example-security-group1"]
  tags = {
    Name = "syndey vm"
  }
}
#data "aws_vpc" "vpc-0c90c6a8d9f61a770" {
 # default = true
# Declare the default VPC data block for the selected region
data "aws_vpc" "default_vpc" {
  default = true
}

# Create a subnet in the default VPC (Sydney region)
resource "aws_subnet" "sydney_subnet" {
  vpc_id                  = data.aws_vpc.default_vpc.id
  cidr_block              = "10.0.2.0/24"  # Define the subnet CIDR block
  availability_zone       = "ap-south-1a"  # Specify the availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Sydney Subnet"
  }
}

# EC2 instance in Sydney region with the created subnet
resource "aws_instance" "sydney" {
  ami               = "ami-0146fc9ad419e2cfd"
  instance_type     = "t2.micro"
  provider          = aws.ap-southeast-2
  subnet_id         = aws_subnet.sydney_subnet.id  # Reference the created subnet
  tags = {
    Name = "sydney vm"
  }
}

# Output the instance ID for the Sydney EC2 instance
output "instance_id_ap-southeast-2" {
  value = aws_instance.sydney.id
}

#hello