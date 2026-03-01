#network module resource creation
module "network" {
  source = "../modules/network"

  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

#bastion-ec2 module resource creation
module "bastion" {
  source = "../modules/bastion"

  env               = var.env
  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  bastion_instance_type     = var.bastion_instance_type
  bastion_ami_id            = var.bastion_ami_id
  my_ip             = var.my_ip
  key_name          = var.key_name
}

#rds module resource creation
module "rds" {
  source = "../modules/rds"

  env               = var.env
  vpc_id            = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  bastion_sg_id     = module.bastion.bastion_sg_id
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_name           = var.db_name
}
