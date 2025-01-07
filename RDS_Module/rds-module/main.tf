  resource "aws_db_instance" "this" {
    instance_class          = var.instance_class
    allocated_storage        = var.allocated_storage
    engine                    = var.engine
    engine_version           = var.engine_version
    username                  = var.username
    password                  = var.password
    db_name                    = var.db_name
   # subnet_ids                 = var.subnet_ids
    vpc_security_group_ids   = var.vpc_security_group_ids
    tags                       = var.tags
    skip_final_snapshot       = var.skip_final_snapshot

    #final_snapshot_identifier = var.final_snapshot_identifier
  }
  resource "aws_security_group_rule" "allow_ec2_to_rds" {
      type                     = "ingress"
      from_port                 = 5432 // or the port number you're using
      to_port                   = 5432
      protocol                  = "tcp"
      source_security_group_id = var.aws_instance_security_group_id
      security_group_id         = var.vpc_security_group_ids[0]
  }