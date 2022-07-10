#  variables.tf

variable "project_name" {
  type = string
}

variable "tag_environment" {
  type        = string
  description = "environment tag"
}

variable "ssh_source_ip" {
  type        = string
  description = "source IP to open SSH Access"
}

variable "ec2_key_name" {
  type        = string
  description = "the name of the key required to ssh into our ec2 instances"
}

variable "ec2_public_key" {
  type        = string
  description = "the public key value to login to our ec2 instances"
}

variable "ec2_ami_id" {
  type        = string
  description = "AMI Id for all EC2 instances"
}