locals {
  region = "ap-south-1"

  cluster_name = "my-ecs-cluster"
  cluster_setting = [
    {
      name  = "containerInsights"
      value = "enabled"
    }
  ]
  cluster_tags = {
    Project = "my-ecs-project"
  }

  # Autoscaling Group Variables
  asg_name                = "my-asg"
  asg_vpc_zone_identifier = ["subnet-0bf8855a50aa576c7", "subnet-0b7455cf8b3dd6e00"]
  asg_desired_capacity    = 2
  asg_min_size            = 1
  asg_max_size            = 3
  asg_instances_tags = {
    Name = "my-asg-instance"
  }
  asg_tags = {
    Project = "my-ecs-project"
  }

  # Launch Template Variables
  asg_create_launch_template = true
  asg_launch_template = {
    image_id           = "ami-068e0f1a600cd311c"
    instance_type      = "t2.micro"
    key_name           = "test-atlantis"
    security_group_ids = []
  }

  # IAM Role Variables
  asg_iam_role_name = "my-asg-role"
  asg_iam_role_tags = {
    Project = "my-ecs-project"
  }

  # IAM Instance Profile Variables
  asg_iam_instance_profile_name = "my-asg-instance-profile"
  asg_iam_instance_profile_tags = {
    Project = "my-ecs-project"
  }
}
