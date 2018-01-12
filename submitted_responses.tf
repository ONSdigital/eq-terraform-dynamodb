resource "aws_dynamodb_table" "submitted_responses_table" {
  name           = "${var.env}-submitted-responses"
  read_capacity  = "${var.submitted_responses_read_capacity}"
  write_capacity = "${var.submitted_responses_write_capacity}"
  hash_key       = "tx_id"

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
}

output "submitted_responses_table_name" {
  value = "${aws_dynamodb_table.submitted_responses_table.name}"
}