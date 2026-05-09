terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
      configuration_aliases = [ aws.cad ]
    }
  }
}

resource "aws_security_group" "dev" {
  name = "dev-sg"
  provider = aws.cad
}

resource "aws_security_group" "prod" {
    name = "prod-sg"
}

