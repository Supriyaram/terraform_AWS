# creates iam_user
resource "aws_iam_user" "this" {
  name = var.user_name
}

# creates iam_group
resource "aws_iam_group" "this" {
  name = var.group_name
}

# attaches user to group 
resource "aws_iam_group_membership" "this" {
  name  = "${var.group_name}-membership"
  users = [aws_iam_user.this.name]
  group = aws_iam_group.this.name
}

#attaches policy to group
resource "aws_iam_policy_attachment" "this" {
  name       = "${var.user_name}-policy-attachment"
  groups     = [aws_iam_group.this.name]
  policy_arn = var.policy_arn
}


resource "aws_iam_role" "ec2_role" {
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

resource "aws_iam_role_policy_attachment" "ec2-attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = var.policy_arn
}


# Create IAM Instance Profile for EC2, allows EC2 to use the role
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}
