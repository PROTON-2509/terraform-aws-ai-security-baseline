resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/ai-security"
  retention_in_days = 90

  tags = {
    Project = "AI Security Baseline"
  }
}