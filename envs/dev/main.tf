module "iam_user" {
  source            = "../../modules/iam/dev-user"
  user_name         = var.user_name
  group_name        = var.group_name
  policy_arns      = var.policy_arns
  tags = {
    Environment     = "dev"
    Owner           = "DevOps"
  }
}


module "ec2_instance" {
  source                 = "../../modules/ec2"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  public_key_path        = var.public_key_path
  instance_profile       = var.instance_profile
  availability_zone = var.availability_zone
  ebs_volume_size = var.ebs_volume_size
}

module "s3" {
  source = "../../modules/s3"
  bucket_name = var.bucket_name
  object_key = var.object_key
  enable_versioning = true
  files_to_upload =  var.files_to_upload
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr 
}

module "lambda" {
  source = "../../modules/lambda"
  
}