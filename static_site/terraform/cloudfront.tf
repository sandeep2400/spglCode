locals {
  s3_origin_id = var.domain_origin
}

# Read the ACM certificte  for your site cert
data "aws_acm_certificate" "site_cert" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
}

# Create a cloudfront distribution for your S3-hosted static website 

resource "aws_cloudfront_distribution" "s3_static_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_static_bucket.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
  }

  enabled             = true
  default_root_object = "index.html"

  # log requests to the distribution to the logging bucket you created. 
  logging_config {
    include_cookies = false
    bucket          = aws_s3_bucket.my_logging_bucket.bucket_domain_name
    prefix          = "log_cf_static"
  }

  # An alias to your domain.
  aliases = [var.domain_name]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    # How to serve your site (http / https / or redirect all to https)
    
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  tags = var.tags

  # An ACM SSL certificate to encrypt the contents of your site. 
  
  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.site_cert.arn
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  custom_error_response {
    error_code         = "500"
    response_code      = "200"
    response_page_path = "/error.html"
  }
}