module "iam_user" {
  source      = "../../modules/iam/ops-user"
  user_name   = "ops-user"
  group_name  = "dev-operaters"
  policy_arn_admin = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  policy_arn_s3 = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  tags = {
    Environment = "dev"
    Owner       = "DevOps"
  }
}
