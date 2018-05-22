# eq-terraform-dynamodb

Terraform project that creates the DynamoDB infrastructure for the EQ Survey-Runner

To import this module add the following code into you Terraform project:

```
module "survey-runner-dynamodb" {
  source                                 = "github.com/ONSdigital/eq-terraform-dynamodb"
  env                                    = "${var.env}"
  aws_access_key                         = "${var.aws_access_key}"
  aws_secret_key                         = "${var.aws_secret_key}"
  slack_alert_sns_arn                    = "${module.survey-runner-alerting.slack_alert_sns_arn}"
  submitted_responses_min_read_capacity  = 1
  submitted_responses_max_read_capacity  = 100
  submitted_responses_min_write_capacity = 1
  submitted_responses_max_write_capacity = 100
  questionnaire_state_min_read_capacity  = 1
  questionnaire_state_max_read_capacity  = 100
  questionnaire_state_min_write_capacity = 1
  questionnaire_state_max_write_capacity = 100
  eq_session_min_read_capacity           = 1
  eq_session_max_read_capacity           = 100
  eq_session_min_write_capacity          = 1
  eq_session_max_write_capacity          = 100
  used_jti_claim_min_read_capacity       = 1
  used_jti_claim_max_read_capacity       = 100
  used_jti_claim_min_write_capacity      = 1
  used_jti_claim_max_write_capacity      = 100
}
```

To run this module on its own run the following code: (Replacing 'XXX' with your values)

```
terraform apply -var "env=XXX" \
                -var "aws_access_key=XXX" \
                -var "aws_secret_key=XXX" \
                -var "slack_alert_sns_arn=XXX" \
                -var "submitted_responses_min_read_capacity=XXX" \
                -var "submitted_responses_max_read_capacity=XXX" \
                -var "submitted_responses_min_write_capacity=XXX" \
                -var "submitted_responses_max_write_capacity=XXX" \
                -var "questionnaire_state_min_read_capacity=XXX" \
                -var "questionnaire_state_max_read_capacity=XXX" \
                -var "questionnaire_state_min_write_capacity=XXX" \
                -var "questionnaire_state_max_write_capacity=XXX" \
                -var "eq_session_min_read_capacity=XXX" \
                -var "eq_session_max_read_capacity=XXX" \
                -var "eq_session_min_write_capacity=XXX" \
                -var "eq_session_max_write_capacity=XXX" \
                -var "used_jti_claim_min_read_capacity=XXX" \
                -var "used_jti_claim_max_read_capacity=XXX" \
                -var "used_jti_claim_min_write_capacity=XXX" \
                -var "used_jti_claim_max_write_capacity=XXX"
```
