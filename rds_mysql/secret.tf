data "aws_secretsmanager_random_password" "spgl_db_pwd" {
  password_length     = 18
  exclude_punctuation = true
}

resource "aws_secretsmanager_secret" "spgl_db_pswd_secret" {
  name                    = var.db_pswd_scrt
  recovery_window_in_days = 0

  tags = {
    Project     = var.project_name
    environment = var.tag_environment
  }
}

resource "aws_secretsmanager_secret_version" "mysql_password_secret_version" {
  secret_id     = aws_secretsmanager_secret.spgl_db_pswd_secret.id
  secret_string = data.aws_secretsmanager_random_password.spgl_db_pwd.random_password
}
