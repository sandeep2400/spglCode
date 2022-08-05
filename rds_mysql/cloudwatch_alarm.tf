resource "aws_cloudwatch_metric_alarm" "mysql_error_rate_alarm" {
  alarm_name                = var.cw_alarm_name
  alarm_description         = var.cw_alarm_desc
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "4"
  metric_name               = "IncomingLogEvents"
  namespace                 = "AWS/Logs"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "20"
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.user_alarms.arn]

  dimensions = {
    LogGroupName = "/aws/rds/instance/${var.rds_db_identifier}/error"
  }

  tags = {
    Project     = var.project_name
    environment = var.tag_environment
  }

  depends_on = [aws_db_instance.spgl_mysql]

}
