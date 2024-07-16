##############################
# ECS Cluster
##############################

output "cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = module.ecs_cluster.arn
}

output "cluster_name" {
  description = "Name of the ECS Cluster"
  value       = var.cluster_name
}
