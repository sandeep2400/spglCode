# SNS Topic for CloudWatch Alarms
resource "aws_sns_topic" "user_alarms" {
  name         = var.sns_topic_name
  display_name = var.sns_topic_display

  tags = {
    Project     = var.project_name
    environment = var.tag_environment
  }
}

# Subscribe to the topuc via email
resource "aws_sns_topic_subscription" "notify_user_sql_err_email" {
  topic_arn              = aws_sns_topic.user_alarms.arn
  protocol               = "email"
  endpoint_auto_confirms = true
  endpoint               = var.sns_notify_email
}

# Subscribe to the topuc via SMS
resource "aws_sns_topic_subscription" "notify_user_sql_err_sms" {
  topic_arn              = aws_sns_topic.user_alarms.arn
  protocol               = "sms"
  endpoint_auto_confirms = true
  endpoint               = var.sns_notify_sms
}




