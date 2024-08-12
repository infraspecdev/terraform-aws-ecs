variable "name" {
  description = "Name of the ECS Cluster to create"
  type        = string
  nullable    = false
}

variable "service_connect_namespace" {
  description = "(Optional) ARN of the aws_service_discovery_http_namespace that's used when you create a service and don't specify a Service Connect configuration."
  type        = string
  default     = null
}

variable "setting" {
  description = "Details of the setting configuration"
  type = list(object({
    name  = string
    value = string
  }))
  nullable = false
  default  = []
}

variable "tags" {
  description = "Resource Tags for ECS Cluster"
  type        = map(any)
  nullable    = false
  default     = {}
}
