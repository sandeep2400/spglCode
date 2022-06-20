# Find the hosted zone for your domain

data "aws_route53_zone" "static_zone" {
  name = var.domain_name
}

output "hosted_zone_name_servers" {
  description = "name servers of hosted zone"
  value       = data.aws_route53_zone.static_zone.name_servers
}

# Update the name server of the domain with the ones 
# from it's hosted zone.
 
resource "aws_route53domains_registered_domain" "static_domain" {
  domain_name = var.domain_name

  dynamic "name_server" {
    for_each = data.aws_route53_zone.static_zone.name_servers
    iterator = ns

    content {
      name = ns.value
    }
  }
}

# Create an A record and point it to 
# the Cloudfront distribution. 

resource "aws_route53_record" "arec" {
  zone_id = data.aws_route53_zone.static_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_static_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_static_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}