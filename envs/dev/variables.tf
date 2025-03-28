variable "aws_region" {
    description = "name of the AWS region to deploy code in"
    default = "us-east-1"
}

variable "user_name" {
    description = "The IAM username"
    type        = string
}
variable "group_name" {
    description = "The IAM group name"
    type        = string
}

variable "policy_arns" {
    description = "The ARN of the policy to attach"
    type        = list(string)
    default = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  ]
}
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

variable "availability_zone" {
  description = "AZ in region"
  type = string
  
}

variable "ebs_volume_size" {
  description = "The size of the drive in GiBs"
  type = number
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
  default = "supriya0304-terraform-s3-bucket"
}

variable "object_key" {
    description = "key of an object"
    type = string 
}

variable "vpc_cidr" {
    description = "cidr block for VPC"
    type = string
    
}

variable "subnet_cidr" {
    description = "cidr block for subnet"
    type = string
    
}

variable "files_to_upload" {
    description = "Map of files to upload"
    type        = map(string)
}

