output "user_arn" {
  description = "The ARN of the IAM user"
  value       = var.user_name
}

output "group_name" {
  description = "The name of the IAM group"
  value       = aws_iam_group.this.name
}
