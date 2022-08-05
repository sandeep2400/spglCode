# Route Table

resource "aws_default_route_table" "rt_spgl" {
  default_route_table_id = aws_vpc.vpc_spgl.default_route_table_id

  tags = {
    Name        = "rt-${var.project_name}-1"
    environment = var.tag_environment
  }
}

# Add route to route_table permitting internet traffic from the gateway.
resource "aws_route" "route_ig_rt" {
  route_table_id         = aws_default_route_table.rt_spgl.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_spgl.id
}