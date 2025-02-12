variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool

  validation {
    condition     = var.force_destroy == true || var.force_destroy == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "object_lock_enabled" {
  description = "Whether object lock is enabled for the bucket"
  type        = bool

  validation {
    condition     = var.object_lock_enabled == true || var.object_lock_enabled == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
}

variable "lock_type" {
  description = "The lock type for object lock (COMPLIANCE or GOVERNANCE)"
  type        = string

  validation {
    condition     = var.lock_type == "COMPLIANCE" || var.lock_type == "GOVERNANCE"
    error_message = "Valid options are 'COMPLIANCE' or 'GOVERNANCE'."
  }
}

variable "lock_days" {
  description = "The number of days for object lock retention"
  type        = number

  validation {
    condition     = var.lock_days >= 0
    error_message = "Lock days must be a non-negative number."
  }
}

variable "versioning_enabled" {
  description = "Whether versioning is enabled for the bucket"
  type        = bool

  validation {
    condition     = var.versioning_enabled == true || var.versioning_enabled == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "enable_expiration" {
  description = "Whether to enable expiration for the bucket"
  type        = bool

  validation {
    condition     = var.enable_expiration == true || var.enable_expiration == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "expiration_days" {
  description = "The number of days before objects expire, or 'never' for no expiration"
  type        = string

  validation {
    condition     = can(regex("^[0-9]+$", var.expiration_days)) || var.expiration_days == "never"
    error_message = "Expiration days must be a positive integer or 'never'."
  }
}

variable "enable_cors" {
  description = "Whether to enable CORS for the bucket"
  type        = bool

  validation {
    condition     = var.enable_cors == true || var.enable_cors == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "allowed_origins" {
  description = "A list of origins allowed for CORS"
  type        = list(string)

  validation {
    condition     = var.enable_cors == false || length(var.allowed_origins) > 0
    error_message = "Allowed origins must be specified when CORS is enabled."
  }
}

variable "object_ownership" {
  description = "The object ownership setting for the bucket (BucketOwnerPreferred, ObjectWriter)"
  type        = string

  validation {
    condition     = var.object_ownership == "BucketOwnerPreferred" || var.object_ownership == "ObjectWriter"
    error_message = "Valid options are 'BucketOwnerPreferred' or 'ObjectWriter'."
  }
}

variable "enable_website" {
  description = "Whether to enable website hosting for the bucket"
  type        = bool

  validation {
    condition     = var.enable_website == true || var.enable_website == false
    error_message = "Please enter 'true' or 'false'."
  }
}

variable "index_document" {
  description = "The index document for the website"
  type        = string
}
