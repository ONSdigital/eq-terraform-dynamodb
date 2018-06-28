variable "env" {
  description = "The environment you wish to use"
}

variable "aws_secret_key" {
  description = "Amazon Web Service Secret Key"
}

variable "aws_access_key" {
  description = "Amazon Web Service Access Key"
}

variable "slack_alert_sns_arn" {
  description = "The ARN of sns topic for slack alerts"
}

variable "submitted_responses_min_read_capacity" {
  description = "The min number of Read units for the Submitted Responses table"
  default     = 25
}

variable "submitted_responses_max_read_capacity" {
  description = "The max number of Read units for the Submitted Responses table"
  default     = 5000
}

variable "submitted_responses_min_write_capacity" {
  description = "The min number of Write units for the Submitted Responses table"
  default     = 25
}

variable "submitted_responses_max_write_capacity" {
  description = "The max number of Write units for the Submitted Responses table"
  default     = 5000
}

variable "questionnaire_state_min_read_capacity" {
  description = "The min number of Read units for the Questionnaire State table"
  default     = 25
}

variable "questionnaire_state_max_read_capacity" {
  description = "The max number of Read units for the Questionnaire State table"
  default     = 5000
}

variable "questionnaire_state_min_write_capacity" {
  description = "The min number of Write units for the Questionnaire State table"
  default     = 25
}

variable "questionnaire_state_max_write_capacity" {
  description = "The max number of Write units for the Questionnaire State table"
  default     = 5000
}

variable "eq_session_min_read_capacity" {
  description = "The min number of Read units for the EQ Session table"
  default     = 25
}

variable "eq_session_max_read_capacity" {
  description = "The max number of Read units for the EQ Session table"
  default     = 5000
}

variable "eq_session_min_write_capacity" {
  description = "The min number of Write units for the EQ Session table"
  default     = 25
}

variable "eq_session_max_write_capacity" {
  description = "The max number of Write units for the EQ Session table"
  default     = 5000
}

variable "used_jti_claim_min_read_capacity" {
  description = "The min number of Read units for the Used JTI claims table"
  default     = 1
}

variable "used_jti_claim_max_read_capacity" {
  description = "The max number of Read units for the Used JTI claims table"
  default     = 5000
}

variable "used_jti_claim_min_write_capacity" {
  description = "The min number of Write units for the Used JTI claims table"
  default     = 25
}

variable "used_jti_claim_max_write_capacity" {
  description = "The max number of Write units for the Used JTI claims table"
  default     = 5000
}
