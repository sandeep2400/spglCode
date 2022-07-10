# Create a new VPC with `default` tenency. 
# Choose an IpV4 range of `10.0.0.0/24` which 
# gives us 253 usable IPs

resource "aws_vpc" "vpc_spgl" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name        = "vpc-${var.project_name}-1"
    environment = var.tag_environment
  }
}

output "show_vpc" {
  value = aws_vpc.vpc_spgl.arn
}

