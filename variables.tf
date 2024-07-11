#######################
# ECS Cluster Variables
#######################

variable "create_cluster" {
  description = "Creates an ECS cluster"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the ECS Cluster to create"
  type        = string
  default     = ""
}

variable "cluster_tags" {
  description = "Resource Tags for ECS Cluster"
  type        = map(any)
  default     = {}
}

#######################
# ECS Service Variables
#######################

variable "service_name" {
  description = "Name of the ECS Service"
  type        = string
}

variable "cluster_arn" {
  description = "ARN of the ECS cluster under which the service will be created"
  type        = string
  default     = null

  validation {
    condition     = var.cluster_arn == null || startswith(var.cluster_arn != null ? var.cluster_arn : "", "arn:")
    error_message = "Specified Cluster ARN must be a valid ARN starting with \"arn:\"."
  }
}

variable "service_subnet_ids" {
  description = "VPC subnet ids where the ECS services will be deployed"
  type        = list(string)

  validation {
    condition     = length(var.service_subnet_ids) > 0
    error_message = "Specified subnet ids must contain at least one valid subnet identifier."
  }

  validation {
    condition     = alltrue([for subnet_id in var.service_subnet_ids : startswith(subnet_id, "subnet-")])
    error_message = "Specified subnet ids must be valid subnet identifiers starting with \"subnet-\"."
  }
}

variable "service_cpu" {
  description = "CPU allocation for ECS task definitions"
  type        = number

  validation {
    condition     = var.service_cpu > 0
    error_message = "Specified CPU allocation must be a positive number."
  }
}

variable "service_memory" {
  description = "Memory allocation for ECS task definitions"
  type        = number

  validation {
    condition     = var.service_memory > 0
    error_message = "Specified Memory allocation must be a positive number."
  }
}

variable "service_tags" {
  description = "Resource Tags for ECS Service"
  type        = map(any)
  default     = {}
}
