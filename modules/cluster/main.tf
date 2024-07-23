resource "aws_ecs_cluster" "this" {
  name = var.name

  configuration {
    execute_command_configuration {
      logging = "NONE"
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
