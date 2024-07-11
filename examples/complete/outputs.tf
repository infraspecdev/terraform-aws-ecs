################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "Identifier of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR Block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "Identifiers of the Private Subnets"
  value       = module.vpc.private_subnets
}

output "private_subnets_arns" {
  description = "ARNs of the Private Subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "CIDR Blocks of the Private Subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "Identifiers of the Public Subnets"
  value       = module.vpc.public_subnets
}

output "public_subnets_arns" {
  description = "ARNs of the Public Subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "CIDR Blocks of the Public Subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

################################################################################
# ECS EC2 Module
################################################################################

output "ecs_cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = module.ecs.cluster_arn
}

output "ecs_service_id" {
  description = "Identifier of the ECS Service"
  value       = module.ecs.service_id
}
