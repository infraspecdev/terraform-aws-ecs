variable "cluster_name" {
  description = "(Required) Name of the cluster"
  type        = string
  nullable    = false
}

variable "cluster_service_connect_namespace" {
  description = "(Optional) ARN of the aws_service_discovery_http_namespace that's used when you create a service and don't specify a Service Connect configuration."
  type        = string
  default     = null
}

variable "cluster_setting" {
  description = "(Optional) Configuration block(s) with cluster settings."
  type = list(object({
    name  = string
    value = string
  }))
  nullable = false
  default  = []
}

variable "cluster_tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  nullable    = false
  default     = {}
}

################################################################################
# Autoscaling Group
################################################################################

variable "asg_name" {
  description = "(Optional) Name of the Auto Scaling Group."
  type        = string
  default     = null
}

variable "asg_vpc_zone_identifier" {
  description = "(Optional) List of subnet IDs to launch resources in."
  type        = list(string)
  nullable    = false
  default     = []

  validation {
    condition     = alltrue([for subnet_id in var.asg_vpc_zone_identifier : startswith(subnet_id, "subnet-")])
    error_message = "Specified subnet ids must be valid subnet identifiers starting with \"subnet-\"."
  }
}

variable "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  type        = number

  validation {
    condition     = try(var.asg_desired_capacity >= 0, true)
    error_message = "Specified desired capacity must be a valid non-negative number."
  }
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number

  validation {
    condition     = try(var.asg_min_size >= 0, true)
    error_message = "Specified min. size must be a valid non-negative number."
  }
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number

  validation {
    condition     = try(var.asg_max_size >= 0, null)
    error_message = "Specified max. size must be a valid non-negative number."
  }
}

variable "asg_protect_from_scale_in" {
  description = " (Optional) Whether newly launched instances are automatically protected from termination by Amazon EC2 Auto Scaling when scaling in."
  type        = bool
  nullable    = false
  default     = false
}

variable "asg_health_check_type" {
  description = "(Optional) \"EC2\" or \"ELB\". Controls how health checking is done."
  type        = string
  nullable    = false
  default     = "EC2"
}

variable "asg_instances_tags" {
  description = "Resources Tags to propagate to the Instances"
  type        = map(string)
  nullable    = false
  default     = {}
}

variable "asg_tags" {
  description = "Resources Tags for Autoscaling group"
  type        = map(string)
  nullable    = false
  default     = {}
}

################################################################################
### Launch Template
################################################################################

variable "asg_create_launch_template" {
  description = "Either to create a Launch Template to associate with the Autoscaling group"
  type        = bool
  nullable    = false
  default     = true
}

variable "asg_launch_template" {
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
  nullable = false
  default  = {}
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

variable "asg_launch_template_version" {
  description = "(Optional) Template version."
  type        = string
  default     = "$Default"
}

################################################################################
### IAM Role
################################################################################

variable "asg_iam_role_name" {
  description = "(Optional, Forces new resource) Friendly name of the role."
  type        = string
  default     = null
}

variable "asg_iam_role_policy_attachments" {
  description = "(Optional) - The ARNs of the policies you want to apply"
  type        = list(string)
  nullable    = false
  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]
}

variable "asg_iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  nullable    = false
  default     = {}
}

################################################################################
### IAM Instance Profile
################################################################################

variable "asg_iam_instance_profile_name" {
  description = "(Optional, Forces new resource) Name of the instance profile."
  type        = string
  default     = null
}

variable "asg_iam_instance_profile_tags" {
  description = "(Optional) Map of resource tags for the IAM Instance Profile."
  type        = map(string)
  nullable    = false
  default     = {}
}
