output "storage_key_id" {
  description = "ID of the storage KMS key"
  value       = aws_kms_key.storage.id
}

output "storage_key_arn" {
  description = "ARN of the storage KMS key"
  value       = aws_kms_key.storage.arn
}

output "secrets_key_id" {
  description = "ID of the secrets KMS key"
  value       = aws_kms_key.secrets.id
}

output "secrets_key_arn" {
  description = "ARN of the secrets KMS key"
  value       = aws_kms_key.secrets.arn
}

output "logs_key_id" {
  description = "ID of the logs KMS key"
  value       = aws_kms_key.logs.id
}

output "logs_key_arn" {
  description = "ARN of the logs KMS key"
  value       = aws_kms_key.logs.arn
}