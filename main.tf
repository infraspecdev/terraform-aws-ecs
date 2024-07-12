################################################################################
# ECS Cluster
################################################################################

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 5.11.3"

  count = var.create_cluster ? 1 : 0

  cluster_name                          = var.cluster_name
  default_capacity_provider_use_fargate = false

  create_cloudwatch_log_group = false

  tags = var.cluster_tags
}

################################################################################
# ECS Service
################################################################################

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 5.11.3"

  name        = var.service_name
  cluster_arn = var.create_cluster ? module.ecs_cluster[0].arn : var.cluster_arn
  subnet_ids  = var.service_subnet_ids

  cpu    = var.service_cpu
  memory = var.service_memory

  launch_type              = "EC2"
  requires_compatibilities = ["EC2"]

  container_definitions = {
    demo = {
      image         = "amazon/amazon-ecs-sample:latest"
      port_mappings = []

      readonly_root_filesystem = false

      enable_cloudwatch_logging   = false
      create_cloudwatch_log_group = false
    }
  }

  create_task_exec_policy = false
  create_security_group   = false

  enable_autoscaling   = false
  autoscaling_policies = {}

  tags = var.service_tags
}
