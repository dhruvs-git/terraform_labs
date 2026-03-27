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

variable "iams" {
  type = map 
  default = {
    user1 = "jack"
    user2 = "luffy"
    user3 = "heyya"
  }
}

resource "aws_iam_user" "my_iam" {
  for_each = var.iams 
  name = each.value
}

output "iam_users" {
  value = [for user in aws_iam_user.my_iam : user.arn]
}