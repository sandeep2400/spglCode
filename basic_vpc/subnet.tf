# Subnets
# Create 2 subnets and associate them with the right NACL. 

resource "aws_subnet" "subnet_public" {
  vpc_id            = aws_vpc.vpc_spgl.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet-${var.project_name}-public"
    environment = var.tag_environment
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id            = aws_vpc.vpc_spgl.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "us-east-1b"

  tags = {
    Name        = "subnet-${var.project_name}-private"
    environment = var.tag_environment
  }
}

resource "aws_network_acl_association" "nacl_public_1" {
  network_acl_id = aws_network_acl.nacl_public.id
  subnet_id      = aws_subnet.subnet_public.id
}

resource "aws_network_acl_association" "nacl_private_1" {
  network_acl_id = aws_network_acl.nacl_private.id
  subnet_id      = aws_subnet.subnet_private.id
}