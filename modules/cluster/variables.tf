variable "name" {
  description = "Name of the ECS Cluster to create"
  type        = string
}

variable "setting" {
  description = "Details of the setting configuration"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "tags" {
  description = "Resource Tags for ECS Cluster"
  type        = map(any)
  default     = {}
}
