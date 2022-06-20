# Bucket for server access logging. 
resource "aws_s3_bucket" "my_logging_bucket" {
  bucket        = "my-spgl-cloud-logging-bucket"
  force_destroy = true
  tags = {
    Name        = "My logging bucket"
    environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.my_logging_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "alllogs" {
  bucket        = aws_s3_bucket.my_static_bucket.id
  target_bucket = aws_s3_bucket.my_logging_bucket.id
  target_prefix = "log_static_site/"
}

