# The Terraform provider file. 

# Pick an AWS Provider and use the 4.0 version
# of the plugin

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

# Select a region 
provider "aws" {
  region = "us-east-1"
}
