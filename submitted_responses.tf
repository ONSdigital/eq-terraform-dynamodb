resource "aws_dynamodb_table" "submitted_responses_table" {
  name           = "${var.env}-submitted-responses"
  hash_key       = "tx_id"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "tx_id"
    type = "S"
  }

  ttl {
    attribute_name = "valid_until"
    enabled        = true
  }

  tags {
    Name        = "${var.env}-submitted-responses"
    Environment = "${var.env}"
  }

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}

resource "aws_cloudwatch_metric_alarm" "submitted_responses_table_read_throttled" {
  alarm_name          = "${var.env}-dynamodb-submitted-responses-read-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Submitted Responses DynamoDB has had at least 1 read throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.submitted_responses_table.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "submitted_responses_table_write_throttled" {
  alarm_name          = "${var.env}-dynamodb-submitted-responses-write-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Submitted Responses DynamoDB has had at least 1 write throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.submitted_responses_table.name}"
  }
}

output "submitted_responses_table_name" {
  value = "${aws_dynamodb_table.submitted_responses_table.name}"
}

output "submitted_responses_table_arn" {
  value = "${aws_dynamodb_table.submitted_responses_table.arn}"
}
