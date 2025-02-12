provider "aws" {
  region = "us-east-1"
  
}
# Generate a random ID for the bucket name suffix
resource "random_id" "unique" {
  byte_length = 8
}
# Define local variables
locals {
  transitions = [
    {
      days          = 30
      storage_class = "STANDARD_IA"
    },
    {
      days          = 60
      storage_class = "GLACIER"
    }
  ]

  cors_methods = ["GET", "POST", "PUT"]
}

# S3 Bucket resource
resource "aws_s3_bucket" "example" {
  bucket              = "${var.bucket_prefix}-${random_id.unique.hex}"
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
}

# Object Lock Configuration for S3 bucket
resource "aws_s3_bucket_object_lock_configuration" "example" {
  count  = var.object_lock_enabled ? 1 : 0
  bucket = aws_s3_bucket.example.id

  rule {
    default_retention {
      mode = var.lock_type
      days = var.lock_days
    }
  }
}

# Versioning Configuration for the S3 bucket
resource "aws_s3_bucket_versioning" "example" {
  count  = var.object_lock_enabled ? 1 : 0  # Enable only when Object Lock is enabled
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Lifecycle Configuration
resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    id     = "multi-tier_transition_and_expiration_and_abort"
    status = "Enabled"

    dynamic "transition" {
      for_each = local.transitions
      content {
        days          = transition.value.days
        storage_class = transition.value.storage_class
      }
    }

    dynamic "expiration" {
      for_each = var.enable_expiration && var.expiration_days != "never" ? [1] : []
      content {
        days = var.expiration_days != "never" ? var.expiration_days : null
      }
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

# S3 CORS Configuration
resource "aws_s3_bucket_cors_configuration" "example" {
  count  = var.enable_cors ? 1 : 0
  bucket = aws_s3_bucket.example.id

  cors_rule {
    allowed_methods = local.cors_methods
    allowed_origins = var.enable_cors && length(var.allowed_origins) > 0 ? var.allowed_origins : ["*"]
    allowed_headers = ["Authorization", "Content-Type", "x-amz-date", "x-amz-security-token"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }
}

# S3 Ownership Controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    object_ownership = var.object_ownership
  }
}

# Static Website Hosting Configuration for the S3 Bucket
resource "aws_s3_bucket_website_configuration" "example" {
  count  = var.enable_website ? 1 : 0
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = var.index_document
  }
}
