variable "aws_region" {
    description = "name of the AWS region to deploy code in"
    default = "us-east-1"
}

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

variable "object_key" {
  description = "key of an object"
  type = string  
}

variable "files_to_upload" {
  description = "Map of files to upload"
  type        = map(string)
}

variable "content_types" {
  description = "Mapping of file extensions to content types"
  type        = map(string)
  default = {
    "index.html" = "text/html"
    "error.html" = "text/html"
    "css"        = "text/css"
    "js"         = "application/javascript"
    "png"        = "image/png"
    "jpg"        = "image/jpeg"
  }
}