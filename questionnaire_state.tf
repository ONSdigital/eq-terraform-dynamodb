resource "aws_dynamodb_table" "questionnaire_state_table" {
  name           = "${var.env}-questionnaire-state"
  read_capacity  = "${var.questionnaire_state_read_capacity}"
  write_capacity = "${var.questionnaire_state_write_capacity}"
  hash_key       = "user_id"

  attribute {
    name = "user_id"
    type = "S"
  }

  tags {
    Name        = "${var.env}-questionnaire-state"
    Environment = "${var.env}"
  }
}

output "questionnaire_state_table_name" {
  value = "${aws_dynamodb_table.questionnaire_state_table.name}"
}

output "questionnaire_state_table_arn" {
  value = "${aws_dynamodb_table.questionnaire_state_table.arn}"
}