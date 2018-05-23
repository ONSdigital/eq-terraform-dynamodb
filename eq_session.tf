resource "aws_dynamodb_table" "eq_session_table" {
  name           = "${var.env}-eq-session"
  read_capacity  = "${var.eq_session_read_capacity}"
  write_capacity = "${var.eq_session_write_capacity}"
  hash_key       = "eq_session_id"

  attribute {
    name = "eq_session_id"
    type = "S"
  }

  tags {
    Name        = "${var.env}-eq-session"
    Environment = "${var.env}"
  }
}

output "eq_session_table_name" {
  value = "${aws_dynamodb_table.eq_session_table.name}"
}

output "eq_session_table_arn" {
  value = "${aws_dynamodb_table.eq_session_table.arn}"
}