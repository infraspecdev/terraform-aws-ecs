locals {
  cluster_logging = "NONE"
}

resource "aws_ecs_cluster" "this" {
  name = var.name

  configuration {
    execute_command_configuration {
      logging = local.cluster_logging
    }
  }

  dynamic "service_connect_defaults" {
    for_each = var.service_connect_namespace != null ? [1] : []

    content {
      namespace = var.service_connect_namespace
    }
  }

  dynamic "setting" {
    for_each = var.setting
    iterator = setting

    content {
      name  = setting.value.name
      value = setting.value.value
    }
  }

  tags = var.tags
}
