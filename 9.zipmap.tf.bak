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

variable "my_iam" {
    type = list
    default = ["hello", "howAre" , "you"]
}
resource "aws_iam_user" "myusers" {
  name = var.my_iam[count.index]
  count = length(var.my_iam)
}

output "name_arn" {
  value = zipmap(aws_iam_user.myusers[*].name , aws_iam_user.myusers[*].arn)
}