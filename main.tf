provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./modules/s3"  # Reference the s3 module

  # Pass variables to the s3 module
  aws_region          = var.aws_region
  bucket_prefix       = var.bucket_prefix
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
  lock_type           = var.lock_type
  lock_days           = var.lock_days
  versioning_enabled  = var.versioning_enabled
  expiration_days     = var.expiration_days
  object_ownership    = var.object_ownership
  allowed_origins     = var.allowed_origins
  website_enabled     = var.website_enabled
}
