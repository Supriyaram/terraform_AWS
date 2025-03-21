output "user_arn" {
  description = "The ARN of the IAM user"
  value       = module.iam_user.user_arn
}

output "group_name" {
  description = "The name of the IAM group"
  value       = module.iam_user.group_name
}
