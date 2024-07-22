output "id" {
  description = "Identifier of the Autoscaling group"
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "ARN of the Autoscaling group"
  value       = aws_autoscaling_group.this.arn
}

################################################################################
# Launch Template
################################################################################

output "launch_template_id" {
  description = "Identifier of the Launch Template"
  value       = var.create_launch_template ? aws_launch_template.this[0].id : var.launch_template_id
}

output "launch_template_arn" {
  description = "ARN of the Launch Template"
  value       = var.create_launch_template ? aws_launch_template.this[0].arn : null
}

################################################################################
# IAM Instance Profile
################################################################################

output "iam_role_id" {
  description = "Identifier of the IAM Role"
  value       = aws_iam_role.this.id
}

output "iam_instance_profile_id" {
  description = "Identifier of the IAM Instance Profile"
  value       = aws_iam_instance_profile.this.id
}

output "iam_instance_profile_arn" {
  description = "ARN of the IAM Instance Profile"
  value       = aws_iam_instance_profile.this.arn
}
