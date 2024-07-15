#######################
# ECS Cluster Variables
#######################

variable "cluster_name" {
  description = "Name of the ECS Cluster to create"
  type        = string
}

variable "cluster_tags" {
  description = "Resource Tags for ECS Cluster"
  type        = map(any)
  default     = {}
}
