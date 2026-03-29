terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "ca-central-1"
  profile = "terralearn"
}

variable "ec2_type" {}

data "aws_ec2_instance_type" "ec22" {
  instance_type = var.ec2_type
}

data "aws_ami" "ami_fetch" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "myec2" {
  instance_type = var.ec2_type
  ami           = data.aws_ami.ami_fetch.id



  lifecycle {
    precondition {
      condition     = data.aws_ec2_instance_type.ec22.free_tier_eligible
      error_message = "this instance is not free tier eligible"
    }

    postcondition {
      condition     = self.public_ip == ""
      error_message = "no public ip"
    }
  }
}