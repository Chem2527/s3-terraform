
# modules/s3/outputs.tf

# Output the S3 bucket name
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.bucket
}

# Output the S3 bucket ID
output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

# Output the S3 bucket URL
output "bucket_url" {
  description = "The URL of the S3 bucket"
  value       = "https://${aws_s3_bucket.example.bucket}.s3.amazonaws.com"
}

# Output the versioning status of the S3 bucket
output "versioning_status" {
  description = "The versioning status of the S3 bucket"
  value       = aws_s3_bucket_versioning.example.versioning_configuration[0].status
}

# Output the object lock configuration details
output "object_lock_configuration" {
  description = "The object lock configuration for the S3 bucket"
  value       = aws_s3_bucket_object_lock_configuration.example.rule[0].default_retention
}

# Output the lifecycle configuration details
output "lifecycle_configuration" {
  description = "The lifecycle configuration of the S3 bucket"
  value       = aws_s3_bucket_lifecycle_configuration.example.rule[0]
}

# Output the CORS configuration for the S3 bucket
output "cors_configuration" {
  description = "The CORS configuration for the S3 bucket"
  value       = aws_s3_bucket_cors_configuration.example.cors_rule
}

# Output the tags associated with the S3 bucket
output "bucket_tags" {
  description = "The tags associated with the S3 bucket"
  value       = var.tags
}

# Output the allowed origins for CORS
output "allowed_origins" {
  description = "The list of allowed origins for CORS"
  value       = var.allowed_origins
}

# Output the object ownership configuration for the S3 bucket
output "object_ownership" {
  description = "The object ownership configuration for the S3 bucket"
  value       = aws_s3_bucket_ownership_controls.example.rule[0].object_ownership
}

