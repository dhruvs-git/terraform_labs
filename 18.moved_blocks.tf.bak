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

resource "aws_iam_user" "myuser" {
  name = "hello"
}

moved {
  from = aws_iam_user.myuser12
  to   = aws_iam_user.myuser
}