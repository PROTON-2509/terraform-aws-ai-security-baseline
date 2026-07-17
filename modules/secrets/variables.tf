variable "app_name" {
  description = "Application name used for the secret"
  type        = string
}

variable "secrets_kms_key_id" {
  description = "KMS Key ID used to encrypt the secret"
  type        = string
}