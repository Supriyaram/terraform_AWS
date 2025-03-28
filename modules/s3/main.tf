
#create s3 bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  # policy = data.aws_iam_policy_document.this #"policy" is deprecated:

  tags = {
    Name  = "ec2-bucket"
  }
}

#policy to allow all access to s3
data "aws_iam_policy_document" "this" { #data- a data source that helps generate an IAM policy document inside Terraform, 'resource' will create new resource
  statement {                           #It does not create a new resource but constructs a policy JSON that can be referenced in Terraform configuration.
    sid    = "AllowFullAccessToMyself"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::203918864735:user/dev-user"]  
    }

    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.this.arn}"]
  }
}

#this attaches the policy to bucket
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}



#policy to make bucket publicly available on www
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({                     #Always disable "block public access" in bucket/permissions
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}
#enables static hosting for bucket
resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


#upload single object in s3
resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key    = var.object_key       # This will store the file in a "backup" folder in S3
  source = "../../global/user_data.sh"     # Refers to a  file in the directory
  
}

#upload multiple objects to enable static hosting 
resource "aws_s3_object" "upload" {
  for_each = var.files_to_upload
  bucket = var.bucket_name
  key    = each.key
  source = each.value
  content_type = lookup(var.content_types, each.key, "application/octet-stream")

  # Optional
  etag = filemd5(each.value) # Ensures file is only uploaded if it has changed
}

#enabling versioning
resource "aws_s3_bucket_versioning" "this" {    #can't enable versioning directly within aws_s3_bucket; 
  bucket = aws_s3_bucket.this.id                   #it needs to be configured using aws_s3_bucket_versioning

  versioning_configuration {
    status = "Enabled"
  }
}
