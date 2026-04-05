

module "ec2_instancee" {
  source = "../../modules/ec2"
  # dont use absolute Path use relative path from the main.tf 
  # where you are referencing the module
}


