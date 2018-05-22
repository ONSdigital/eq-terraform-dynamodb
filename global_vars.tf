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

variable "questionnaire_state_read_capacity" {
  description = "The number of Read units for the Questionnaire State table"
  default     = 25
}

variable "questionnaire_state_write_capacity" {
  description = "The number of Write units for the Questionnaire State table"
  default     = 25
}
variable "eq_session_read_capacity" {
  description = "The number of Read units for the EQ Session table"
  default     = 25
}

variable "eq_session_write_capacity" {
  description = "The number of Write units for the EQ Session table"
  default     = 25
}
variable "used_jti_claim_read_capacity" {
  description = "The number of Read units for the Used JTI claims table"
  default     = 25
}

variable "used_jti_claim_write_capacity" {
  description = "The number of Write units for the Used JTI claims table"
  default     = 25
}