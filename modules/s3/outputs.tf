output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_url" {
  description = "The URL of the S3 bucket"
  value       = "https://${aws_s3_bucket.example.bucket}.s3.amazonaws.com"
}

output "versioning_status" {
  description = "The versioning status of the S3 bucket"
  value = length(aws_s3_bucket_versioning.example) > 0 ? aws_s3_bucket_versioning.example[0].versioning_configuration[0].status : "Not enabled"
}



output "object_lock_configuration" {
  description = "The Object Lock configuration for the S3 bucket"
  value       = var.object_lock_enabled ? aws_s3_bucket_object_lock_configuration.example[0].rule[0].default_retention : null
}

output "lifecycle_configuration" {
  description = "The lifecycle configuration of the S3 bucket"
  value       = aws_s3_bucket_lifecycle_configuration.example.rule[0]
}

output "cors_configuration" {
  description = "The CORS configuration for the S3 bucket"
  value       = var.enable_cors ? aws_s3_bucket_cors_configuration.example[0].cors_rule : null
}

output "website_endpoint" {
  description = "The website endpoint for static website hosting"
  value       = var.enable_website ? aws_s3_bucket_website_configuration.example[0].website_endpoint : null
}

output "bucket_tags" {
  description = "The tags associated with the S3 bucket"
  value       = var.tags
}

output "object_ownership" {
  description = "The object ownership configuration for the S3 bucket"
  value       = aws_s3_bucket_ownership_controls.example.rule[0].object_ownership
}
