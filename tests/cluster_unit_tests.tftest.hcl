provider "aws" {
  region = "ap-south-1"
}

################################################################################
# Autoscaling Group
################################################################################

run "ecs_cluster_attributes_match" {
  command = plan

  module {
    source = "./modules/cluster"
  }

  variables {
    name                      = "example-cluster-name"
    service_connect_namespace = "arn:aws:cloudmap:us-west-2:123456789012:namespace/ns-1234567890123456"

    setting = [
      {
        name  = "containerInsights",
        value = "enabled"
      }
    ]

    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = aws_ecs_cluster.this.name == var.name
    error_message = "Name mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].logging == "NONE"
    error_message = "Execute command configuration logging mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.service_connect_defaults[0].namespace == var.service_connect_namespace
    error_message = "Service connect namespace mismatch"
  }

  assert {
    condition     = length(aws_ecs_cluster.this.setting) == 1
    error_message = "Setting count mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.setting == toset(var.setting)
    error_message = "Setting mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.tags == var.tags
    error_message = "Tags mismatch"
  }
}
