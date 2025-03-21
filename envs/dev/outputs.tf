output "user_arn" {
  description = "The ARN of the IAM user"
  value       = module.iam_user.user_arn
}

output "group_name" {
  description = "The name of the IAM group"
  value       = module.iam_user.group_name
}

output "key_name" {
  value = module.ec2_instance.key_name #module.module_name defined in envs/dev/main.tf(root module).attribute
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "sg_name" {
  description = "name of sg created"
  value = module.ec2_instance.sg_name
}

