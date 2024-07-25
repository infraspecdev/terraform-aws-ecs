################################################################################
# ECS Cluster
################################################################################

module "cluster" {
  source = "./modules/cluster"

  name                      = var.cluster_name
  service_connect_namespace = var.cluster_service_connect_namespace
  setting                   = var.cluster_setting
  tags                      = var.cluster_tags
}

################################################################################
# Autoscaling Group
################################################################################

module "asg" {
  source = "./modules/asg"

  cluster_name = module.cluster.name

  name                = var.asg_name
  vpc_zone_identifier = var.asg_vpc_zone_identifier
  desired_capacity    = var.asg_desired_capacity
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  instances_tags      = var.asg_instances_tags
  tags                = var.asg_tags

  # Launch Template
  create_launch_template  = var.asg_create_launch_template
  launch_template_id      = var.asg_launch_template_id
  launch_template         = var.asg_launch_template
  launch_template_version = var.asg_launch_template_version

  # IAM Role
  iam_role_name               = var.asg_iam_role_name
  iam_role_policy_attachments = var.asg_iam_role_policy_attachments
  iam_role_tags               = var.asg_iam_role_tags

  # IAM Instance Profile
  iam_instance_profile_name = var.asg_iam_instance_profile_name
  iam_instance_profile_tags = var.asg_iam_instance_profile_tags
}
