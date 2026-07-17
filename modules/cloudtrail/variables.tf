variable "logs_kms_key_arn" {
  description = "KMS Key ARN used to encrypt CloudTrail logs"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}