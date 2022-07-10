#  Security Group

# Unlike NACLs which are tied to a subnet, Security groups are tied to VMs. 
# Although our rules in this security group appear similar to those in the NACL, 
# you can fine-tune these rules based on your business case. 
 
resource "aws_security_group" "sg_public" {
  name        = "secgrp-${var.project_name}-public"
  description = "Public SG allowing web and ssh traffic"
  vpc_id      = aws_vpc.vpc_spgl.id

  # HTTPS inbound traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP inbound traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH inbound traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_source_ip]
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