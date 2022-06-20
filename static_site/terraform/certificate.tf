# resource "aws_acm_certificate" "site_cert" {
#   domain_name       = "planetspecs.com"
#   validation_method = "DNS"

#   tags = {
#     Environment = "test",
#     Project     = "spgl static"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }