output "id" {
  description = "Auto Scaling Group id."
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "ARN for this Auto Scaling Group."
  value       = aws_autoscaling_group.this.arn
}

################################################################################
# Launch Template
################################################################################

output "launch_template_id" {
  description = "The ID of the launch template."
  value       = var.create_launch_template ? aws_launch_template.this[0].id : var.launch_template_id
}

output "launch_template_arn" {
  description = "Amazon Resource Name (ARN) of the launch template."
  value       = var.create_launch_template ? aws_launch_template.this[0].arn : null
}

################################################################################
# IAM Instance Profile
################################################################################

output "iam_role_id" {
  description = "Name of the role."
  value       = aws_iam_role.this.id
}

output "iam_instance_profile_id" {
  description = "Instance profile's ID."
  value       = aws_iam_instance_profile.this.id
}

output "iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile."
  value       = aws_iam_instance_profile.this.arn
}
