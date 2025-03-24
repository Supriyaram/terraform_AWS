variable "bucket_name" {
    description = "Name of bucket"
    type = string
    default = "value"
}

variable "enable_versioning" {
  description = "Globally unique name for the S3 bucket"
  type        = bool
  default = false
}