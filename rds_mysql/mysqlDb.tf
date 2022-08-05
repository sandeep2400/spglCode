data "aws_kms_key" "rds_alias" {
  key_id = "alias/aws/rds"
}

data "aws_secretsmanager_secret" "spgl_db_pswd_secret" {
  name = var.db_pswd_scrt
  depends_on = [
    aws_secretsmanager_secret.spgl_db_pswd_secret
  ]
}

data "aws_secretsmanager_secret_version" "mysql_password_secret_version" {
  secret_id = data.aws_secretsmanager_secret.spgl_db_pswd_secret.id

  depends_on = [
    aws_secretsmanager_secret_version.mysql_password_secret_version
  ]
  
}

resource "aws_db_subnet_group" "spgl_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet_public_first.id, aws_subnet.subnet_public_second.id]

  tags = {
    Name        = "subnet-group-${var.project_name}"
    environment = var.tag_environment
  }
}

resource "aws_db_instance" "spgl_mysql" {
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.large"
  db_name             = var.rds_db_name
  identifier          = var.rds_db_identifier
  username            = var.rds_db_username
  password            = data.aws_secretsmanager_secret_version.mysql_password_secret_version.secret_string
  port                = "3306"
  publicly_accessible = "true"

  kms_key_id        = data.aws_kms_key.rds_alias.arn
  storage_encrypted = true

  db_subnet_group_name   = aws_db_subnet_group.spgl_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_public.id]

  storage_type          = "gp2"
  allocated_storage     = 10
  max_allocated_storage = 100

  multi_az = true

  apply_immediately          = true
  auto_minor_version_upgrade = true
  skip_final_snapshot        = true
  backup_retention_period    = 21


  performance_insights_enabled          = true
  performance_insights_kms_key_id       = data.aws_kms_key.rds_alias.arn
  performance_insights_retention_period = 31

  enabled_cloudwatch_logs_exports = ["audit", "general", "error", "slowquery"]


  tags = {
    Project     = var.project_name
    environment = var.tag_environment
  }
}

output "new_db_name" {
  value = aws_db_instance.spgl_mysql.name
}

output "new_db_endpoint" {
  value = aws_db_instance.spgl_mysql.endpoint
}
