module "ecs" {
  source = "../../"

  cluster_name    = var.cluster_name
  cluster_setting = var.cluster_setting
  cluster_tags    = var.cluster_tags

  # ASG Variables
  asg_name                = var.asg_name
  asg_vpc_zone_identifier = var.asg_vpc_zone_identifier
  asg_desired_capacity    = var.asg_desired_capacity
  asg_min_size            = var.asg_min_size
  asg_max_size            = var.asg_max_size
  asg_instances_tags      = var.asg_instances_tags
  asg_tags                = var.asg_tags

  # Launch Template
  asg_create_launch_template  = var.asg_create_launch_template
  asg_launch_template         = var.asg_launch_template
  asg_launch_template_version = var.asg_launch_template_version

  # IAM Role
  asg_iam_role_name = var.asg_iam_role_name
  asg_iam_role_tags = var.asg_iam_role_tags

  # IAM Instance Profile
  asg_iam_instance_profile_name = var.asg_iam_instance_profile_name
  asg_iam_instance_profile_tags = var.asg_iam_instance_profile_tags
}
