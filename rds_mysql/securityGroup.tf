#  Security Group

resource "aws_security_group" "sg_public" {
  name        = "secgrp-${var.project_name}-public"
  description = "Public SG allowing mysql traffic"
  vpc_id      = aws_vpc.vpc_spgl.id

  # MYSQL inbound traffic
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-${var.project_name}-public"
  }
}