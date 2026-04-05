
provider "aws" {
  region  = "ca-central-1"
  profile = "terralearn"
}

module "ec2_instancee" {
  source = "../../modules/ec2"
  instance_type = "t3.micro"
  # dont use absolute Path use relative path from the main.tf where we are making use of the module 
  # where you are referencing the module
}


