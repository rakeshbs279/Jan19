provider "aws" {
  region = "ap-south-1"
}

module "rds" {
  source = "../rds-module"

  instance_class    = "db.t3.micro"
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "11.22"
  username          = "postgres"
  password          = "password123"
  db_name           = "mydb"
  #subnet_ids = ["subnet-0e05e0c2fcafc98b4"]
  vpc_security_group_ids = ["sg-03ff24b7c46b7994a"]
  tags = {
    Name        = "my-rds-instance"
    Environment = "dev"
  }
  skip_final_snapshot          = true
  aws_instance_security_group_id = "sg-03ff24b7c46b7994a"

  #final_snapshot_identifier    = "mydb-final-snapshot-${timestamp()}"
}

resource "aws_security_group_rule" "allow_internal_rds" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  source_security_group_id = "sg-03ff24b7c46b7994a" # Self-reference
  security_group_id        = "sg-03ff24b7c46b7994a"
}