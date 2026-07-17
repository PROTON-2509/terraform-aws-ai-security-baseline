data "aws_caller_identity" "current" {}

resource "aws_kms_key" "storage" {
  description             = "AI Security baseline: storage encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_kms_key" "secrets" {
  description             = "AI Security baseline: secrets encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_kms_key" "logs" {
  description             = "AI Security baseline: log encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "EnableIAMUserPermissions"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }

        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "AllowCloudTrailUseOfKey"
        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = [
          "kms:GenerateDataKey*",
          "kms:Decrypt",
          "kms:DescribeKey"
        ]

        Resource = "*"
      }
    ]
  })
}