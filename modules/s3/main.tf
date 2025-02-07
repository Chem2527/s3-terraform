# Generate a unique bucket name
resource "random_id" "unique" {
  byte_length = 8
}

# S3 Bucket resource
resource "aws_s3_bucket" "example" {
  bucket            = "${var.bucket_prefix}-${random_id.unique.hex}"
  force_destroy     = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags              = var.tags
}

# Object Lock Configuration for S3 bucket
resource "aws_s3_bucket_object_lock_configuration" "example" {
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
  bucket = aws_s3_bucket.example.bucket

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

# Local variables for lifecycle, CORS, and transitions
locals {
  transitions   = [
    { days = 30, storage_class = "INTELLIGENT_TIERING" },
    { days = 90, storage_class = "GLACIER" },
    { days = 180, storage_class = "DEEP_ARCHIVE" }
  ]
  cors_methods  = ["GET", "POST", "PUT", "DELETE"]
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

    expiration {
      days = var.expiration_days
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

# S3 CORS Configuration
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  cors_rule {
    allowed_methods = local.cors_methods
    allowed_origins = var.allowed_origins
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
  bucket = aws_s3_bucket.example.id
  count  = var.website_enabled ? 1 : 0

  index_document {
    suffix = "index.html"
  }
}
