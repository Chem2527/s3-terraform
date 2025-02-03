variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name starting with the specified prefix"
  type        = string
}

variable "force_destroy" {
  description = "Whether to delete all objects when the bucket is destroyed"
  type        = bool
}

variable "object_lock_enabled" {
  description = "Whether the object lock configuration is enabled"
  type        = bool
}

variable "tags" {
  description = "Tags to assign to the bucket"
  type        = map(string)
}

variable "lock_type" {
  description = "The type of object lock configuration"
  type        = string
}

variable "lock_days" {
  description = "Retention period in days for the object lock"
  type        = number
}

variable "versioning_enabled" {
  description = "Whether to enable versioning for the bucket"
  type        = bool
}

variable "expiration_days" {
  description = "The number of days before objects are expired"
  type        = number
}

variable "object_ownership" {
  description = "Defines the object ownership control for the S3 bucket"
  type        = string
}

variable "allowed_origins" {
  description = "A list of origins that are allowed to make CORS requests"
  type        = list(string)
}

variable "website_enabled" {
  description = "Whether to enable static website hosting"
  type        = bool
}

