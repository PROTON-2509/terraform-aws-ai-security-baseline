output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "bedrock_endpoint_id" {
  description = "ID of the Bedrock VPC Endpoint"
  value       = aws_vpc_endpoint.bedrock.id
}

output "ai_security_group_id" {
  description = "ID of the AI workload security group"
  value       = aws_security_group.ai_egress_allowlist.id
}