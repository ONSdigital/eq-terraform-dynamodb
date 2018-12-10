resource "aws_dynamodb_table" "questionnaire_state_table" {
  name           = "${var.env}-questionnaire-state"
  hash_key       = "user_id"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "user_id"
    type = "S"
  }

  tags {
    Name        = "${var.env}-questionnaire-state"
    Environment = "${var.env}"
  }

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}

resource "aws_cloudwatch_metric_alarm" "questionnaire_state_table_read_throttled" {
  alarm_name          = "${var.env}-dynamodb-questionnaire-state-read-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Questionnaire State DynamoDB has had at least 1 read throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.questionnaire_state_table.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "questionnaire_state_table_write_throttled" {
  alarm_name          = "${var.env}-dynamodb-questionnaire-state-write-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Questionnaire State DynamoDB has had at least 1 write throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.questionnaire_state_table.name}"
  }
}

output "questionnaire_state_table_name" {
  value = "${aws_dynamodb_table.questionnaire_state_table.name}"
}

output "questionnaire_state_table_arn" {
  value = "${aws_dynamodb_table.questionnaire_state_table.arn}"
}
