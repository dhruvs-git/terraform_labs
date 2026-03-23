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

data "aws_ami" "ami_fetch" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.ami_fetch.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "ec2-1"
  }
}