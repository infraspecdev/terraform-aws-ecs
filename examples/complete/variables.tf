################################################################################
# ECS Cluster
################################################################################

variable "cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "cluster_setting" {
  description = "The settings to use when creating the cluster."
  type = list(object({
    name  = string
    value = string
  }))
}

variable "cluster_tags" {
  description = "A map of tags to assign to the cluster."
  type        = map(string)
}

################################################################################
# Autoscaling Group
################################################################################

variable "asg_name" {
  description = "The name of the Auto Scaling Group."
  type        = string
}

variable "asg_vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the Auto Scaling Group."
  type        = number
}

variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group."
  type        = number
}

variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group."
  type        = number
}

variable "asg_instances_tags" {
  description = "A map of tags to assign to the instances within the Auto Scaling Group."
  type        = map(string)
}

variable "asg_tags" {
  description = "A map of tags to assign to the Auto Scaling Group."
  type        = map(string)
}

variable "asg_create_launch_template" {
  description = "Whether to create a launch template."
  type        = bool
}

variable "asg_launch_template" {
  description = "The configuration of the launch template."
  type = object({
    image_id           = string
    instance_type      = string
    key_name           = string
    security_group_ids = list(string)
  })
}

variable "asg_launch_template_version" {
  description = "The version of the launch template to use."
  type        = string
}

variable "asg_iam_role_name" {
  description = "The name of the IAM role for the Auto Scaling Group."
  type        = string
}

variable "asg_iam_role_tags" {
  description = "A map of tags to assign to the IAM role."
  type        = map(string)
}

variable "asg_iam_instance_profile_name" {
  description = "The name of the IAM instance profile for the Auto Scaling Group."
  type        = string
}

variable "asg_iam_instance_profile_tags" {
  description = "A map of tags to assign to the IAM instance profile."
  type        = map(string)
}
