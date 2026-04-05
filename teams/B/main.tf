provider "aws" {
  region = "ca-central-1"
  profile = "terralearn"
}

module "ec2_instancee" {
  source = "../../modules/ec2"
  instance_type = "t3.micro"
}

module "sgg" {
  source = "../../modules/sg"
  name = "module-sg"
#   security_groups = [80, 8080] 
# overriding the module values
}