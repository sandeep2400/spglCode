#  variables.tf

variable "project_name" {
  type = string
}

variable "tag_environment" {
  type        = string
  description = "environment tag"
}

variable "db_pswd_scrt" {
  type        = string
  description = "Secret Name to the Database password"
}

variable "sns_topic_name" {
  type        = string
  description = "Name of the MySql Error Topic"
}

variable "sns_topic_display" {
  type        = string
  description = "Display name of the MySql Error Topic"
}

variable "sns_notify_email" {
  type        = string
  description = "Email to be notified when the topic publishes an alarm"
}

variable "sns_notify_sms" {
  type        = string
  description = "Phone number to be notified when the the SNS topic publishes an alarm"
}


variable "rds_db_name" {
  type        = string
  description = "Database name"
}


variable "rds_db_identifier" {
  type        = string
  description = "Database Identifier"
}

variable "rds_db_username" {
  type        = string
  description = "Database Username"
}


variable "cw_alarm_name" {
  type        = string
  description = "Name of the cloudwatch alarm"
}


variable "cw_alarm_desc" {
  type        = string
  description = "Description of the cloudwatch alarm"
}

