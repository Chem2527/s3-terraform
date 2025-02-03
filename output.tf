# Root module output.tf

# Output the S3 bucket name from the module
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3.bucket_name
}

# Output the S3 bucket ID from the module
output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = module.s3.bucket_id
}

# Output the S3 bucket URL from the module
output "bucket_url" {
  description = "The URL of the S3 bucket"
  value       = module.s3.bucket_url
}

# Output the versioning status of the S3 bucket
output "versioning_status" {
  description = "The versioning status of the S3 bucket"
  value       = module.s3.versioning_status
}

# Output the object lock configuration details
output "object_lock_configuration" {
  description = "The object lock configuration for the S3 bucket"
  value       = module.s3.object_lock_configuration
}

# Output the lifecycle configuration details
output "lifecycle_configuration" {
  description = "The lifecycle configuration of the S3 bucket"
  value       = module.s3.lifecycle_configuration
}

# Output the CORS configuration for the S3 bucket
output "cors_configuration" {
  description = "The CORS configuration for the S3 bucket"
  value       = module.s3.cors_configuration
}

# Output the tags associated with the S3 bucket
output "bucket_tags" {
  description = "The tags associated with the S3 bucket"
  value       = module.s3.bucket_tags
}

# Output the allowed origins for CORS
output "allowed_origins" {
  description = "The list of allowed origins for CORS"
  value       = module.s3.allowed_origins
}

# Output the object ownership configuration for the S3 bucket
output "object_ownership" {
  description = "The object ownership configuration for the S3 bucket"
  value       = module.s3.object_ownership
}
