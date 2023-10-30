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
  subnet_ids        = ["subnet-06f742412121a2c42", "subnet-0bd1ea15b26a2c6d9"]
  vpc_id            = "vpc-07c0309e03c1c0b61"
  instance_class    = "db.t3.micro"
}