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

/*you write something wrong in the code and you do
terraform validate it will show the same error we get 
when we do terraform apply */

resource "aws_instance" "web" {
  ami = "ami-066ab5c7bf87a3e58"
  instance_type = "t2.micro"
}

/* terraform -replace="aws_instace.web"
This is tainting if someone has changed the config manually so when u do this
tf will destory this and recreate the same instance with the configuration
mentioned in the terraform tf file */