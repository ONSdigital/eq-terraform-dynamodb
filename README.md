# eq-terraform-dynamodb

Terraform project that creates the DynamoDB infrastructure for the EQ Survey-Runner

To import this module add the following code into you Terraform project:

```
module "survey-runner-dynamodb" {
  source                             = "github.com/ONSdigital/eq-terraform-dynamodb"
  env                                = "${var.env}"
  aws_access_key                     = "${var.aws_access_key}"
  aws_secret_key                     = "${var.aws_secret_key}"
  submitted_responses_read_capacity  = 1
  submitted_responses_write_capacity = 1
}
```

To run this module on its own run the following code: (Replacing 'XXX' with your values)

```
terraform apply -var "env=XXX" \
                -var "aws_access_key=XXX" \
                -var "aws_secret_key=XXX" \
                -var "submitted_responses_read_capacity=XXX" \
                -var "submitted_responses_write_capacity=XXX"
```