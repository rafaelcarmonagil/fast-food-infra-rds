/*====
Variables used across all modules
======*/
locals {
  environment = "fast-food"
}

provider "aws" {
  region = var.region
}

module "rds" {
  source            = "./rds"
  environment       = local.environment
  allocated_storage = "20"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
  subnet_ids        = ["subnet-0b8b700720d03c613", "subnet-05cf28d4e5aff2547"]
  vpc_id            = "vpc-0932da4df69a1e2b5"
  instance_class    = "db.t3.micro"
}