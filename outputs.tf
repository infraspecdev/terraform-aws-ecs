##############################
# ECS Cluster Outputs
##############################

output "cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = var.create_cluster ? module.ecs_cluster[0].arn : var.cluster_arn
}

##############################
# ECS Service Outputs
##############################

output "service_id" {
  description = "Identifier of the ECS Service"
  value       = module.ecs_service.id
}
