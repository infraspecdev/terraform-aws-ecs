##############################
# ECS Cluster Outputs
##############################

output "cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = module.ecs_cluster.arn
}
