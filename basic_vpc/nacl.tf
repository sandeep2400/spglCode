# Network ACLs
# Create two NACLs for each subnet of your VPC. 
# One NACL allows web and SSH traffic. 
# The second NACL allows only SSH traffic, keeping it somewhat private. 

# Nacl 1
resource "aws_network_acl" "nacl_public" {
  vpc_id = aws_vpc.vpc_spgl.id

  # Specify your outbound rules here
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # Specify your inbound rules here
  
  # Allow HTTP traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80 
    to_port    = 80
  }

  # Allow HTTPS traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # Allow SSH traffic from your IP. 
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.ssh_source_ip
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name        = "nacl-${var.project_name}-public"
    environment = var.tag_environment
  }
}

output "show_nacl_public" {
  value = aws_vpc.vpc_spgl.arn
}

# Nacl 2
resource "aws_network_acl" "nacl_private" {
  vpc_id = aws_vpc.vpc_spgl.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.ssh_source_ip
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name        = "nacl-${var.project_name}-private"
    environment = var.tag_environment
  }
}
