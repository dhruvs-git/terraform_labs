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

resource "aws_instance" "myec2" {
    ami = "ami-066ab5c7bf87a3e58"
    instance_type = "t3.micro"
    depends_on = [aws_s3_bucket.mys3]
    
}

resource "aws_s3_bucket" "mys3" {
  bucket = "depends_on_s3_bucket"
}