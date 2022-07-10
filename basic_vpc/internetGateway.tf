# internet_gateway
resource "aws_internet_gateway" "ig_spgl" {
  vpc_id = aws_vpc.vpc_spgl.id

  tags = {
    Name        = "ig-${var.project_name}-1"
    environment = var.tag_environment
  }
}

output "show_internet_gateway_id" {
  value = aws_internet_gateway.ig_spgl.id
}