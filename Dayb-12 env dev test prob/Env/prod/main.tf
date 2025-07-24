

provider "aws" {
  region = var.region
  #profile = "prod"
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  env                 = var.env
}
module "ec2" {
  source        = "../../modules/ec2"
  instance_type = var.instance_type
  env           = var.env
  ami_id = var.ami_id
  subnet_id = module.vpc.public_subnet_id
}
module "rds" {
  source         = "../../modules/rds"
  subnet_ids     = module.vpc.private_subnet_ids  # ✅ CORRECT
  instance_class = var.instance_class
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
}