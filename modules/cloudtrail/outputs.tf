output "trail_name" {
  description = "CloudTrail name"
  value       = aws_cloudtrail.main.name
}

output "trail_arn" {
  description = "CloudTrail ARN"
  value       = aws_cloudtrail.main.arn
}

output "trail_bucket_name" {
  description = "S3 bucket storing CloudTrail logs"
  value       = aws_s3_bucket.trail.bucket
}