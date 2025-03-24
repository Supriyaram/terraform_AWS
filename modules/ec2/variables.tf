variable "key_name" {
  description = "Name for the EC2 key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
  default = null
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "instance_profile" {
  description = "instance profile"
  type = string
  default = "null"
}

variable "availability_zone" {
  description = "AZ in region"
  type = string
  
}

variable "ebs_volume_size" {
  description = "The size of the drive in GiBs"
  type = number
}