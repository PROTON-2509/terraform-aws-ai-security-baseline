output "alerts_topic_arn" {
  description = "SNS topic ARN for security and budget alerts"
  value       = aws_sns_topic.alerts.arn
}

output "budget_name" {
  description = "Master account budget name"
  value       = aws_budgets_budget.master.name
}

#output "anomaly_monitor_arn" {
#  description = "Cost Anomaly Detection monitor ARN"
#  value       = aws_ce_anomaly_monitor.account.arn
#}