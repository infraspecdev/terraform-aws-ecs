provider "aws" {
  region = local.region

  default_tags {
    tags = local.default_tags
  }
}

locals {
  region      = "ap-south-1"
  name_prefix = "ex-"

  # VPC
  vpc_cidr            = "10.0.0.0/16"
  vpc_azs             = ["ap-south-1a", "ap-south-1b"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

  # ECS Cluster
  cluster_name = "${local.name_prefix}my-cluster"

  default_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

################################################################################
# ECS Module
################################################################################

module "ecs" {
  source = "../../"

  cluster_name = local.cluster_name

  setting = [
    {
      name  = "containerInsights"
      value = "enabled"
    }
  ]
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.9.0"

  name = "${local.name_prefix}my-vpc"
  cidr = local.vpc_cidr

  azs             = local.vpc_azs
  private_subnets = local.vpc_private_subnets
  public_subnets  = local.vpc_public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false
}
