# creates iam_user
resource "aws_iam_user" "this" {
  name = var.user_name
}

# creates iam_group
resource "aws_iam_group" "this" {
  name = var.group_name
}

# adds user to group 
resource "aws_iam_group_membership" "this" {
  name  = "${var.group_name}-membership"
  users = [aws_iam_user.this.name]
  group = aws_iam_group.this.name
}

#attaches admin policy to group
resource "aws_iam_policy_attachment" "this" {
  name       = "${var.user_name}-policy-attachment"
  groups     = [aws_iam_group.this.name]
  policy_arn = var.policy_arn_admin
}

#attaches s3 policy to user
resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = var.policy_arn_s3
}
