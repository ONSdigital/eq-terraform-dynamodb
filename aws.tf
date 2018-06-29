terraform {
  required_version = ">= 0.10.0, < 0.11.0"

  backend "s3" {
    region = "eu-west-1"
  }
}

provider "aws" {
  version    = ">= 1.17.0"

  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}
