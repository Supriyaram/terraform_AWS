module "iam_user" {
  source            = "../../modules/iam/dev-user"
  user_name         = "dev-user"
  group_name        = "developers"
  policy_arn        = "arn:aws:iam::aws:policy/AdministratorAccess"
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

}
