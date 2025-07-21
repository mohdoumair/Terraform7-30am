


module "rds" {
  source         = "./Modules/Rds"
  subnet_ids     = module.vpc.private_subnet_ids  # ✅ CORRECT
  instance_class = var.instance_class
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
}

module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.cidr_block
  subnet_cidr_1  = var.subnet_cidr_1
  subnet_cidr_2 =   var.subnet_cidr_2
  az_1       = var.az_1
  az_2    =  var.az_2
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_ids[0]


}

 