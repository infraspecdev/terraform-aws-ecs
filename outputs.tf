################################################################################
# ECS Cluster
################################################################################

output "cluster_id" {
  description = "Identifier of the ECS Cluster"
  value       = module.cluster.id
}

output "cluster_arn" {
  description = "ARN that identifies the cluster."
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
  description = "Auto Scaling Group id."
  value       = module.asg.id
}

output "asg_arn" {
  description = "ARN for this Auto Scaling Group."
  value       = module.asg.arn
}

################################################################################
# Launch Template
################################################################################

output "asg_launch_template_id" {
  description = "The ID of the launch template."
  value       = module.asg.launch_template_id
}

output "asg_launch_template_arn" {
  description = "Amazon Resource Name (ARN) of the launch template."
  value       = module.asg.launch_template_arn
}

################################################################################
# IAM Instance Profile
################################################################################

output "asg_iam_role_id" {
  description = "Name of the role."
  value       = module.asg.iam_role_id
}

output "asg_iam_instance_profile_id" {
  description = "Instance profile's ID."
  value       = module.asg.iam_instance_profile_id
}

output "asg_iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile."
  value       = module.asg.iam_instance_profile_arn
}
