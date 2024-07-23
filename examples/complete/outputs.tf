output "cluster_arn" {
  description = "ARN that identifies the cluster."
  value       = module.ecs.cluster_arn
}

output "cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.ecs.cluster_name
}
