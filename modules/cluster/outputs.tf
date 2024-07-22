output "id" {
  description = "Identifier of the ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

output "arn" {
  description = "ARN of the ECS Cluster"
  value       = aws_ecs_cluster.this.arn
}

output "name" {
  description = "Name of the ECS Cluster"
  value       = var.name
}
