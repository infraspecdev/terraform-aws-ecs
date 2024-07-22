################################################################################
# ECS Cluster
################################################################################

variable "cluster_name" {
  description = "Name of the ECS Cluster to create"
  type        = string
}

variable "cluster_setting" {
  description = "Details of the setting configuration"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "cluster_tags" {
  description = "Resource Tags for ECS Cluster"
  type        = map(any)
  default     = {}
}

################################################################################
# Autoscaling Group
################################################################################

variable "asg_name" {
  description = "Name of the Autoscaling Group"
  type        = string
}

variable "asg_vpc_zone_identifier" {
  description = "Identifiers of the VPC Subnets"
  type        = list(string)

  validation {
    condition     = alltrue([for subnet_id in var.asg_vpc_zone_identifier : startswith(subnet_id, "subnet-")])
    error_message = "Specified subnet ids must be valid subnet identifiers starting with \"subnet-\"."
  }
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the Autoscaling group"
  type        = number

  validation {
    condition     = var.asg_desired_capacity >= 0
    error_message = "Specified desired capacity must be a valid non-negative number."
  }
}

variable "asg_min_size" {
  description = "Min. size for the Autoscaling group"
  type        = number

  validation {
    condition     = var.asg_min_size >= 0
    error_message = "Specified min. size must be a valid non-negative number."
  }
}

variable "asg_max_size" {
  description = "Max. size for the Autoscaling group"
  type        = number

  validation {
    condition     = var.asg_max_size >= 0
    error_message = "Specified max. size must be a valid non-negative number."
  }
}

variable "asg_instances_tags" {
  description = "Resources Tags to propagate to the Instances"
  type        = map(any)
  default     = {}
}

variable "asg_tags" {
  description = "Resources Tags for Autoscaling group"
  type        = map(any)
  default     = {}
}

################################################################################
### Launch Template
################################################################################

variable "asg_launch_template" {
  description = "Launch Template to use with the Autoscaling group"
  type = object({
    name                   = optional(string, null)
    image_id               = optional(string, null)
    instance_type          = optional(string, null)
    vpc_security_group_ids = optional(list(string), [])
    key_name               = optional(string, null)
    user_data              = optional(string, null)
    tags                   = optional(map(any), {})
  })
  default = {}
}

variable "asg_create_launch_template" {
  description = "Either to create a Launch Template to associate with the Autoscaling group"
  type        = bool
  default     = true
}

variable "asg_launch_template_id" {
  description = "Identifier of the Launch Template"
  type        = string
  default     = null

  validation {
    condition     = var.asg_launch_template_id == null || startswith(var.asg_launch_template_id != null ? var.asg_launch_template_id : "", "lt-")
    error_message = "Specified launch template id must be valid launch template identifier starting with \"lt-\"."
  }
}

################################################################################
### IAM Role
################################################################################

variable "asg_iam_role_name" {
  description = "Name for the IAM Role"
  type        = string
  default     = null
}

variable "asg_iam_role_policy_attachments" {
  description = "Policy ARNs to attach to the IAM Role"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]
}

variable "asg_iam_role_tags" {
  description = "Resource Tags for IAM Role"
  type        = map(any)
  default     = {}
}

################################################################################
### IAM Instance Profile
################################################################################

variable "asg_iam_instance_profile_name" {
  description = "Name of the IAM Instance Profile"
  type        = string
  default     = null
}

variable "asg_iam_instance_profile_tags" {
  description = "Resource Tags for the IAM Instance Profile"
  type        = map(any)
  default     = {}
}
