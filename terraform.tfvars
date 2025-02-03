aws_region          = "us-east-1"
bucket_prefix       = "saik"
force_destroy       = true
object_lock_enabled = true
tags = {
  "Name"        = "My S3 Bucket"
  "Environment" = "Production"
}
lock_type          = "COMPLIANCE"
lock_days          = 60
versioning_enabled = true
expiration_days    = 365
object_ownership   = "BucketOwnerPreferred"
allowed_origins = [
  "https://yourwebsite.com",
  "https://www.yourwebsite.com"
]
website_enabled = true
