variable "key_name" {
  description = "Name for the key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_profile" {
  description = "instance profile"
  type = string
}