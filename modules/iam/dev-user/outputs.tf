output "user_arn" {
  description = "The ARN of the IAM user"
  value       = aws_iam_user.this.arn
}

output "group_name" {
  description = "The name of the IAM group"
  value       = aws_iam_group.this.name
}
