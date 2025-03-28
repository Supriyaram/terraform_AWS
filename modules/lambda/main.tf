
# Create IAM Role for Lambda
resource "aws_iam_role" "this" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach a basic Lambda policy
resource "aws_iam_policy_attachment" "this" {
  name       = "lambda-basic-policy"
  roles      = [aws_iam_role.this.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Zip Lambda function
data "archive_file" "this" {                           #AWS Lambda requires code to be uploaded as a .zip file, especially when using Python, 
  type        = "zip"                                         # Node.js, or other interpreted languages.
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

# Create the Lambda function
resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = "my_lambda_function"
  role             = aws_iam_role.this.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"

  environment {
    variables = {
      ENV = "dev"
    }
  }
}
