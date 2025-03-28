# # creates iam_user
# resource "aws_iam_user" "this" {
#   name = var.user_name
# }

# creates Iam_group
resource "aws_iam_group" "this" {
  name = var.group_name
}

# attaches user to group 
resource "aws_iam_group_membership" "this" {
  name  = "${var.group_name}-membership"
  users = [var.user_name]
  group = aws_iam_group.this.name
}

#attaches policy to group
resource "aws_iam_policy_attachment" "this" {
  name       = "${var.user_name}-policy-attachment"
  groups     = [aws_iam_group.this.name]
  policy_arn = var.policy_arn
}

#creates Iam role for ec2 to asssumeRole(mandatory)
#this IAM role allows the EC2 instance to perform actions securely without storing AWS credentials on the machine.
resource "aws_iam_role" "this" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Create IAM Instance Profile for EC2, allows EC2 to use the role
#EC2 instance(only) needs an Instance Profile to act as a bridge between the instance and the IAM assume role.
resource "aws_iam_instance_profile" "this" {
  name = "ec2-instance-profile"
  role = aws_iam_role.this.name
}
