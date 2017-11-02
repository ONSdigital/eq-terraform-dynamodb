variable "env" {
  description = "The environment you wish to use"
}

variable "aws_secret_key" {
  description = "Amazon Web Service Secret Key"
}

variable "aws_access_key" {
  description = "Amazon Web Service Access Key"
}

variable "submitted_responses_read_capacity" {
  description = "The number of Read units for the Submitted Responses table"
  default     = 25
}

variable "submitted_responses_write_capacity" {
  description = "The number of Write units for the Submitted Responses table"
  default     = 25
}
