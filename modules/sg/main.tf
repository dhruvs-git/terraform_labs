terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "name" {}

variable "security_groups" {
  type    = list(number)
  default = [443, 80, 8080]
}

resource "aws_security_group" "sg" {
  name = var.name
  dynamic "ingress" {
    for_each = var.security_groups

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
