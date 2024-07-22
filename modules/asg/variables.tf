variable "cluster_name" {
  description = "Name of the ECS Cluster to associate with the Autoscaling Group"
  type        = string
}

variable "name" {
  description = "Name of the Autoscaling Group"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "Identifiers of the VPC Subnets"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired capacity for the Autoscaling group"
  type        = number
}

variable "min_size" {
  description = "Min. size for the Autoscaling group"
  type        = number
}

variable "max_size" {
  description = "Max. size for the Autoscaling group"
  type        = number
}

variable "instances_tags" {
  description = "Resources Tags to propagate to the Instances"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Resources Tags for Autoscaling group"
  type        = map(any)
  default     = {}
}

################################################################################
# Launch Template
################################################################################

variable "launch_template" {
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

variable "create_launch_template" {
  description = "Either to create a Launch Template to associate with the Autoscaling group"
  type        = bool
  default     = true
}

variable "launch_template_id" {
  description = "Identifier of the Launch Template"
  type        = string
  default     = null
}

################################################################################
# IAM Role
################################################################################

variable "iam_role_name" {
  description = "Name for the IAM Role"
  type        = string
  default     = null
}

variable "iam_role_policy_attachments" {
  description = "Policy ARNs to attach to the IAM Role"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]
}

variable "iam_role_tags" {
  description = "Resource Tags for IAM Role"
  type        = map(any)
  default     = {}
}

################################################################################
# IAM Instance Profile
################################################################################

variable "iam_instance_profile_name" {
  description = "Name of the IAM Instance Profile"
  type        = string
  default     = null
}

variable "iam_instance_profile_tags" {
  description = "Resource Tags for the IAM Instance Profile"
  type        = map(any)
  default     = {}
}
