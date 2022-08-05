resource "aws_vpc" "vpc_spgl" {
  cidr_block           = "10.0.0.0/24"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-${var.project_name}-1"
    environment = var.tag_environment
  }
}


output "show_vpc" {
  value = aws_vpc.vpc_spgl.arn
}
