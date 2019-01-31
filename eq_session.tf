resource "aws_dynamodb_table" "eq_session_table" {
  name           = "${var.env}-eq-session"
  hash_key       = "eq_session_id"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "eq_session_id"
    type = "S"
  }

  ttl {
    attribute_name = "expires_at"
    enabled        = true
  }

  tags {
    Name        = "${var.env}-eq-session"
    Environment = "${var.env}"
  }

  point_in_time_recovery {
    enabled = true
  }

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}

resource "aws_cloudwatch_metric_alarm" "eq_session_table_read_throttled" {
  alarm_name          = "${var.env}-dynamodb-eq-session-read-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Session DynamoDB has had at least 1 read throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.eq_session_table.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "eq_session_table_write_throttled" {
  alarm_name          = "${var.env}-dynamodb-eq-session-write-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Session DynamoDB has had at least 1 write throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.eq_session_table.name}"
  }
}

output "eq_session_table_name" {
  value = "${aws_dynamodb_table.eq_session_table.name}"
}

output "eq_session_table_arn" {
  value = "${aws_dynamodb_table.eq_session_table.arn}"
}
