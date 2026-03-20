provider "aws" {
  region = "ca-central-1"
  profile = "terralearn"
}

variable "first_name" {
    default = "sakshi"
}

variable "last_name" {
    default = "panchal"
  
}



  locals {
    full_name = "${var.first_name}_${var.last_name}"
  }

  resource "aws_iam_user" "sakk" {
    name = local.full_name
  }