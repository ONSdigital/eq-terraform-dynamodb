resource "aws_dynamodb_table" "author_questionnaire_versions_table" {
  name           = "${var.env}-author-questionnaire-versions"
  hash_key       = "id"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  tags {
    Name        = "${var.env}-author-questionnaire-versions"
    Environment = "${var.env}"
  }

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}

resource "aws_cloudwatch_metric_alarm" "author_questionnaire_versions_table_read_throttled" {
  alarm_name          = "${var.env}-dynamodb-author-questionnaire-versions-read-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Author Questionnaire Versions DynamoDB has had at least 1 read throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.author_questionnaire_versions_table.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "author_questionnaire_versions_table_write_throttled" {
  alarm_name          = "${var.env}-dynamodb-author-questionnaire-versions-write-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Author Questionnaire Versions DynamoDB has had at least 1 write throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.author_questionnaire_versions_table.name}"
  }
}

output "author_questionnaire_versions_table_name" {
  value = "${aws_dynamodb_table.author_questionnaire_versions_table.name}"
}

output "author_questionnaire_versions_table_arn" {
  value = "${aws_dynamodb_table.author_questionnaire_versions_table.arn}"
}
