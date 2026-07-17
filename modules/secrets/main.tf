resource "aws_secretsmanager_secret" "app" {
  name                    = "ai-security/${var.app_name}"
  kms_key_id              = var.secrets_kms_key_id
  recovery_window_in_days = 7
}

#resource "aws_secretsmanager_secret_rotation" "app" {
#  secret_id           = aws_secretsmanager_secret.app.id
#  rotation_lambda_arn = aws_lambda_function.rotator.arn
#
#  rotation_rules {
#    automatically_after_days = 90
#  }
#}