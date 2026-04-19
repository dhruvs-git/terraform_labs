terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

/* I am removing this block 
and putting it into our main config file

provider "aws" {
  region  = "ca-central-1"
  profile = "terralearn"
} */

data "aws_ami" "ami_fetch" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

variable "instance_type" {}
variable "vpc_security_group_ids" {
}

resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.ami_fetch.id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "myec2_terraform"
  }
}