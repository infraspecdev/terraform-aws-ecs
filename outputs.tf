##############################
# ECS Cluster
##############################

output "cluster_id" {
  description = "Identifier of the ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

output "cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = aws_ecs_cluster.this.arn
}

output "cluster_name" {
  description = "Name of the ECS Cluster"
  value       = var.cluster_name
}
