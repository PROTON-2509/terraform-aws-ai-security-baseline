output "workload_role_name" {
  description = "Name of the workload IAM role"
  value       = aws_iam_role.workload.name
}

output "workload_role_arn" {
  description = "ARN of the workload IAM role"
  value       = aws_iam_role.workload.arn
}

output "permission_boundary_arn" {
  description = "ARN of the workload permission boundary policy"
  value       = aws_iam_policy.workload_boundary.arn
}