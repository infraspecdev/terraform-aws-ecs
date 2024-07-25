module "ecs" {
  source = "../../"

  cluster_name    = local.cluster_name
  cluster_setting = local.cluster_setting
  cluster_tags    = local.cluster_tags

  # ASG Variables
  asg_name                = local.asg_name
  asg_vpc_zone_identifier = local.asg_vpc_zone_identifier
  asg_desired_capacity    = local.asg_desired_capacity
  asg_min_size            = local.asg_min_size
  asg_max_size            = local.asg_max_size
  asg_instances_tags      = local.asg_instances_tags
  asg_tags                = local.asg_tags

  # Launch Template
  asg_create_launch_template  = local.asg_create_launch_template
  asg_launch_template         = local.asg_launch_template
  asg_launch_template_version = local.asg_launch_template_version

  # IAM Role
  asg_iam_role_name = local.asg_iam_role_name
  asg_iam_role_tags = local.asg_iam_role_tags

  # IAM Instance Profile
  asg_iam_instance_profile_name = local.asg_iam_instance_profile_name
  asg_iam_instance_profile_tags = local.asg_iam_instance_profile_tags
}
