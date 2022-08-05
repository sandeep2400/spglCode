# tfvars

project_name = "spgl"

tag_environment = "demo"

db_pswd_scrt = "spgl_db_password_secret"


sns_topic_name    = "mysql_high_error_rate"
sns_topic_display = "MySQL High Error Rate"
sns_notify_email  = "<your email goes here>"
sns_notify_sms    = "<your number>"

rds_db_name       = "spgl"
rds_db_identifier = "spgl-mysql-db"
rds_db_username   = "admin"

cw_alarm_name = "spgl_mysql_error_rate_alarm"
cw_alarm_desc = "This metric monitors the error rate in Mysql Database."