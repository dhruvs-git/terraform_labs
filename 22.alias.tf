provider "aws" {
  region  = "us-east-1"
  profile = "terralearn"
}

provider "aws" {
  alias   = "canada"
  region  = "ca-central-1"
  profile = "terralearn"

}

# export AWS_PROFILE = "terralearn" 
/* use this so that you dont have to 
   write profile on every configuration 
*/

module "security_g" {
  source = "./modules/security_sg"
  providers = {
    aws.cad = aws.canada
  }
}