variable "cluster_name" {
  description = "Name of the ECS Cluster to associate with the Autoscaling Group"
  type        = string
}

variable "name" {
  description = "(Optional) Name of the Auto Scaling Group."
  type        = string
  default     = null
}

variable "vpc_zone_identifier" {
  description = "(Optional) List of subnet IDs to launch resources in."
  type        = list(string)
  default     = []
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  type        = number
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "protect_from_scale_in" {
  description = " (Optional) Whether newly launched instances are automatically protected from termination by Amazon EC2 Auto Scaling when scaling in."
  type        = bool
  default     = false
}

variable "health_check_type" {
  description = "(Optional) \"EC2\" or \"ELB\". Controls how health checking is done."
  type        = string
  default     = "EC2"
}

variable "instances_tags" {
  description = "Resources Tags to propagate to the Instances"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Resources Tags for Autoscaling group"
  type        = map(string)
  default     = {}
}

################################################################################
# Launch Template
################################################################################

variable "launch_template" {
  description = "Launch Template to use with the Autoscaling group"
  type = object({
    name = optional(string, null)
    block_device_mappings = optional(list(object({
      device_name = string
      ebs = optional(object({
        delete_on_termination = optional(bool, null)
        snapshot_id           = optional(string, null)
        volume_size           = optional(number, null)
        volume_type           = optional(string, null)
      }))
      no_device    = optional(any, null)
      virtual_name = optional(string, null)
    })), [])
    image_id               = optional(string, null)
    instance_type          = optional(string, null)
    vpc_security_group_ids = optional(list(string), [])
    key_name               = optional(string, null)
    user_data              = optional(string, null)
    tags                   = optional(map(string), {})
  })
  default = {}
}

variable "create_launch_template" {
  description = "Either to create a Launch Template to associate with the Autoscaling group"
  type        = bool
  default     = true
}

variable "launch_template_id" {
  description = "(Optional) ID of the launch template."
  type        = string
  default     = null
}

variable "launch_template_version" {
  description = "(Optional) Template version."
  type        = string
  default     = "$Latest"
}

################################################################################
# IAM Role
################################################################################

variable "iam_role_name" {
  description = "(Optional, Forces new resource) Friendly name of the role."
  type        = string
  default     = null
}

variable "iam_role_policy_attachments" {
  description = "(Required) - The ARN of the policy you want to apply"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]
}

variable "iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = {}
}

################################################################################
# IAM Instance Profile
################################################################################

variable "iam_instance_profile_name" {
  description = "(Optional, Forces new resource) Name of the instance profile."
  type        = string
  default     = null
}

variable "iam_instance_profile_tags" {
  description = "(Optional) Map of resource tags for the IAM Instance Profile."
  type        = map(string)
  default     = {}
}
