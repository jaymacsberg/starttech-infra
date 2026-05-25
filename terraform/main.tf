terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./modules/networking"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  environment  = var.environment
}

module "compute" {
  source = "./modules/compute"

  project_name           = var.project_name
  environment            = var.environment
  aws_region             = var.aws_region
  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = module.networking.public_subnet_ids
  private_subnet_ids     = module.networking.private_subnet_ids
  key_pair_name          = var.key_pair_name
  allowed_ssh_cidr       = var.allowed_ssh_cidr
  backend_instance_type  = var.backend_instance_type
  backend_container_port = var.backend_container_port
  backend_image          = var.backend_image
  asg_min_size           = var.asg_min_size
  asg_desired_capacity   = var.asg_desired_capacity
  asg_max_size           = var.asg_max_size
  log_group_name         = module.monitoring.backend_log_group_name
  mongo_uri              = var.mongo_uri
  db_name                = var.db_name
  jwt_secret_key         = var.jwt_secret_key
  enable_cache           = var.enable_cache
  allowed_origins        = var.allowed_origins
  cookie_domains         = var.cookie_domains
}
