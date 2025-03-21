output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "key_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.this.key_name
}

output "sg_name" {
  description = "name of sg created"
  value = aws_security_group.this.name  
}