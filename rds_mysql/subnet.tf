resource "aws_subnet" "subnet_public_first" {
  vpc_id            = aws_vpc.vpc_spgl.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet-${var.project_name}-public_first"
    environment = var.tag_environment
  }
}


resource "aws_subnet" "subnet_public_second" {
  vpc_id            = aws_vpc.vpc_spgl.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "us-east-1b"

  tags = {
    Name        = "subnet-${var.project_name}-public_second"
    environment = var.tag_environment
  }
}