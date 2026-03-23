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

# we will use map variable and now we will 
# assign different cidr to each ports

data "aws_ami" "ami_fetch" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}


resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.ami_fetch.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  tags = {
    Name = "myec2_terraform"
  }
}

variable "security_g" {
  type = map
  default = {
    http = {
      port = 80
      cidr = ["0.0.0.0/0"]
    }

    https = {
      port = 443
      cidr = ["10.0.1.0/24"]
    }

    ssh = {
      port = 22
      cidr = ["173.35.116.24/32"] 
    }
  }
}

resource "aws_security_group" "mysg" {
  name = "security-group-main"

  dynamic "ingress" {
    for_each = var.security_g

    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = "tcp"
      cidr_blocks = ingress.value.cidr
    }
    
  }
}