################################################################################
# ECS Cluster
################################################################################

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 5.11.3"

  cluster_name                          = var.cluster_name
  default_capacity_provider_use_fargate = false

  create_cloudwatch_log_group = false

  tags = var.cluster_tags
}
