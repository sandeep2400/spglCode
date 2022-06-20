# Create a new S3 bucket
resource "aws_s3_bucket" "my_static_bucket" {
  bucket = var.domain_name
  tags   = var.tags
}

# Mark the bucket public, so that anonymous users and the 
# public can read the contents of the site. 
resource "aws_s3_bucket_acl" "my_static_bucket_acl" {
  bucket = aws_s3_bucket.my_static_bucket.id
  acl    = "public-read"
}

# Configure the bucket on the site. 
resource "aws_s3_bucket_website_configuration" "my_static_website_config" {
  bucket = aws_s3_bucket.my_static_bucket.bucket

  index_document { // optional
    suffix = "index.html"
  }

  error_document { // optional
    key = "error.html"
  }
}


resource "aws_s3_bucket_policy" "allow_public_read_access" {
  bucket = aws_s3_bucket.my_static_bucket.id
  policy = data.aws_iam_policy_document.allow_public_read_access.json
}

# Create a bucket policy that allows read access to 
# all objects inside the bucket. 
data "aws_iam_policy_document" "allow_public_read_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
    ]

    resources = [
      aws_s3_bucket.my_static_bucket.arn,
      "${aws_s3_bucket.my_static_bucket.arn}/*",
    ]
  }
}

# Write the index page to your bucket. 
# Note - this is for testing purposes only. 
resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.my_static_bucket.bucket
  key          = "index.html"
  source       = "../index.html"
  content_type = "text/html"
}

# Write the index page to your bucket. 
resource "aws_s3_object" "object2" {
  bucket       = aws_s3_bucket.my_static_bucket.bucket
  key          = "error.html"
  source       = "../error.html"
  content_type = "text/html"
}

# Print the domain of the public website to the terminal. 
output "s3_website_website" {
  description = "URL of the website on S3"
  value       = aws_s3_bucket_website_configuration.my_static_website_config.website_endpoint
}

# Print the domain of the public website to the terminal. 
output "s3_website_website_domain" {
  description = "URL of the website on S3"
  value       = aws_s3_bucket_website_configuration.my_static_website_config.website_domain
}