resource "aws_dynamodb_table" "used_jti_claim_table" {
  name           = "${var.env}-used-jti-claim"
  hash_key       = "jti_claim"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "jti_claim"
    type = "S"
  }

  ttl {
    attribute_name = "expires"
    enabled        = true
  }

  tags {
    Name        = "${var.env}-used-jti-claim"
    Environment = "${var.env}"
  }

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}

resource "aws_cloudwatch_metric_alarm" "used_jti_claim_table_read_throttled" {
  alarm_name          = "${var.env}-dynamodb-used-jti-claim-read-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Used JTI Claim DynamoDB has had at least 1 read throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.used_jti_claim_table.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "used_jti_claim_table_write_throttled" {
  alarm_name          = "${var.env}-dynamodb-used-jti-claim-write-throttled"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "EQ Used JTI Claim DynamoDB has had at least 1 write throttle error in the past 60 seconds"
  alarm_actions       = ["${var.slack_alert_sns_arn}"]

  dimensions {
    TableName = "${aws_dynamodb_table.used_jti_claim_table.name}"
  }
}

output "used_jti_claim_table_name" {
  value = "${aws_dynamodb_table.used_jti_claim_table.name}"
}

output "used_jti_claim_table_arn" {
  value = "${aws_dynamodb_table.used_jti_claim_table.arn}"
}
