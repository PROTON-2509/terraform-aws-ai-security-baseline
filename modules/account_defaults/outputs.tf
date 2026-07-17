output "ebs_encryption_enabled" {
  description = "Whether EBS encryption by default is enabled"
  value       = aws_ebs_encryption_by_default.all.enabled
}

output "default_kms_key_arn" {
  description = "Default KMS key ARN used for EBS encryption"
  value       = var.storage_kms_key_arn
}