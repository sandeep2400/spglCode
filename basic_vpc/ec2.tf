#  EC2 instance

# Specify the KeyPair you will use to SSH into the instance. 
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.ec2_key_name
  public_key = var.ec2_public_key
}


resource "aws_instance" "ec2_public" {
  ami               = var.ec2_ami_id
  instance_type     = "t3.micro"
  key_name          = aws_key_pair.ec2_key_pair.key_name
  availability_zone = "us-east-1a"
  # When spinning an ec2 VM in a VPC, use vpc_security_group_ids instead. 
  vpc_security_group_ids      = [aws_security_group.sg_public.id]
  subnet_id                   = aws_subnet.subnet_public.id
  associate_public_ip_address = true

  tags = {
    Name        = "ec2-${var.project_name}-public"
    environment = var.tag_environment
  }
}

# Print the Public IP of the EC2 instance 
# to the terminal. 
output "ec2_public_ip" {
  value = aws_instance.ec2_public.public_ip
}

