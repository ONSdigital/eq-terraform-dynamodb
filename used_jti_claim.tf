resource "aws_dynamodb_table" "used_jti_claim_table" {
  name           = "${var.env}-used-jti-claim"
  read_capacity  = "${var.used_jti_claim_read_capacity}"
  write_capacity = "${var.used_jti_claim_write_capacity}"
  hash_key       = "jti_claim"

  attribute {
    name = "jti_claim"
    type = "S"
  }

  tags {
    Name        = "${var.env}-used-jti-claim"
    Environment = "${var.env}"
  }
}

output "used_jti_claim_table_name" {
  value = "${aws_dynamodb_table.used_jti_claim_table.name}"
}

output "used_jti_claim_table_arn" {
  value = "${aws_dynamodb_table.used_jti_claim_table.arn}"
}