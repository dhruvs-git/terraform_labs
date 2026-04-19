provider "aws" {
  region = "ca-central-1"
  profile = "terralearn"
}

module "ec2_instancee" {
  source = "../../modules/ec2"
  instance_type = "t3.micro"
  vpc_security_group_ids = module.sgg.sg_group
}

module "sgg" {
  source = "../../modules/sg"
  name = "module-sg"
#   security_groups = [80, 8080] 
# overriding the module values meaning if i put 443 in values
# the above code will override that values
}