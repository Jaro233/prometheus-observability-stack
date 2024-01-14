provider "aws" {
  region = var.region
}

module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name
  project_name      = var.project_name
  environment       = var.environment
  security_group_id = module.sg.security_group_id
}

module "sg" {
  source       = "./modules/sg"
  vpc_id       = var.vpc_id
  my_ip        = var.my_ip
  project_name = var.project_name
  environment  = var.environment
  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules
}