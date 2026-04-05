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

resource "aws_security_group" "mysg" {
  name = "ssh into instance"

  dynamic "ingress" {
    for_each = [22,80]
    content {
      from_port = ingress.value
      to_port = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
    }
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.mysg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
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
  ami                    = data.aws_ami.ami_fetch.id
  instance_type          = "t2.micro"
  key_name               = "lab"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  tags = {
    Name = "myec2_terraform"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/Desktop/labs/lab.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}



