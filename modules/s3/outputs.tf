output "website_url" {
  description = "URL of the S3 static website"
  value       = "http://${aws_s3_bucket.this.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}
