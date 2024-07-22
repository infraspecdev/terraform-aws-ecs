#######################
# ECS Cluster
#######################

variable "cluster_name" {
  description = "Name of the ECS Cluster to create"
  type        = string
}

variable "execute_command_configuration" {
  description = "Details of the execute command configuration"
  type = object({
    kms_key_id = optional(string)
    logging    = optional(string)
    log_configuration = optional(object({
      cloud_watch_encryption_enabled = optional(bool)
      cloud_watch_log_group_name     = optional(string)
      s3_bucket_name                 = optional(string)
      s3_bucket_encryption_enabled   = optional(bool)
      s3_key_prefix                  = optional(string)
    }))
  })
  default = null
}

variable "service_connect_defaults" {
  description = "Default Service Connect namespace"
  type = object({
    namespace = string
  })
  default = null
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
