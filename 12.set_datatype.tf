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

variable "my-list" {
  type = list
  default = ["bob", "alice", "joy"]
}

output "my-list" {
  value = var.my-list[*]  
}


variable "my-set" {
  type = set(string)
  default = [ "hello" , "Heyya" , "hello" ]
}

output "my-set" {
  value = var.my-set
}