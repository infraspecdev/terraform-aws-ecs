################################################################################
# ECS Cluster
################################################################################

output "cluster_id" {
  description = "Identifier of the ECS Cluster"
  value       = module.cluster.id
}

output "cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = module.cluster.arn
}

output "cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.cluster.name
}

################################################################################
# Autoscaling Group
################################################################################

output "asg_id" {
  description = "Identifier of the Autoscaling group"
  value       = module.asg.id
}

output "asg_arn" {
  description = "ARN of the Autoscaling group"
  value       = module.asg.arn
}

################################################################################
# Launch Template
################################################################################

output "asg_launch_template_id" {
  description = "Identifier of the Launch Template being used with the Autoscaling Group"
  value       = module.asg.launch_template_id
}

output "asg_launch_template_arn" {
  description = "ARN of the Launch Template being used with the Autoscaling Group"
  value       = module.asg.launch_template_arn
}

################################################################################
# IAM Instance Profile
################################################################################

output "asg_iam_role_id" {
  description = "Identifier of the IAM Role being used with the IAM Instnace Profile"
  value       = module.asg.iam_role_id
}

output "asg_iam_instance_profile_id" {
  description = "Identifier of the IAM Instance Profile being used with the Launch Template"
  value       = module.asg.iam_instance_profile_id
}

output "asg_iam_instance_profile_arn" {
  description = "ARN of the IAM Instance Profile being used with the Launch Template"
  value       = module.asg.iam_instance_profile_arn
}
