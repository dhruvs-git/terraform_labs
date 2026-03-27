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

variable "server_config" {
  type = object({
    Name          = string
    instance_type = string
  })

  default = {
    Name          = "terraform-ec2"
    instance_type = "t2.micro"
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.ami_fetch.id
  instance_type = var.server_config.instance_type

  tags = {
    Name = var.server_config.Name
  }
}