module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
}

module "security_groups" {
  source           = "./modules/security_groups"
  vpc_id           = module.vpc.vpc_id
  project_name     = var.project_name
  environment      = var.environment
  alb_cidr_ingress = ["0.0.0.0/0"]
  ssh_cidr_ingress = ["0.0.0.0/0"] 
}

module "alb_asg" {
  source             = "./modules/alb_asg"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  alb_sg_id          = module.security_groups.alb_sg_id
  ec2_sg_id          = module.security_groups.ec2_sg_id
  instance_type      = "t3.micro"
  desired_capacity   = 2
  min_size           = 1
  max_size           = 3
}

module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
  environment  = var.environment
}

module "monitoring" {
  source       = "./modules/monitoring"
  project_name = var.project_name
  environment  = var.environment
  asg_name     = module.alb_asg.asg_name
}

