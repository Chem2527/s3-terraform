variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name starting with the specified prefix"
  type        = string
}

variable "force_destroy" {
  description = "Whether to delete all objects when the bucket is destroyed"
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Whether the object lock configuration is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to assign to the bucket"
  type        = map(string)
  default     = {
    "Name"        = "My S3 Bucket"
    "Environment" = "Production"
  }
}

variable "lock_type" {
  description = "The type of object lock configuration"
  type        = string
  default     = "GOVERNANCE"
}

variable "lock_days" {
  description = "Retention period in days for the object lock"
  type        = number
  default     = 30
}

variable "versioning_enabled" {
  description = "Whether to enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "expiration_days" {
  description = "The number of days before objects are expired"
  type        = number
  default     = 30
}

variable "object_ownership" {
  description = "Defines the object ownership control for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "allowed_origins" {
  description = "A list of origins that are allowed to make CORS requests"
  type        = list(string)
  default     = [
    "https://yourwebsite.com",
    "https://www.yourwebsite.com"
  ]
}

variable "website_enabled" {
  description = "Whether to enable static website hosting"
  type        = bool
  default     = false
}
