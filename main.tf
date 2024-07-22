################################################################################
# ECS Cluster
################################################################################

resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  dynamic "configuration" {
    for_each = var.execute_command_configuration != null != null ? [1] : []

    content {
      dynamic "execute_command_configuration" {
        for_each = var.execute_command_configuration != null ? [1] : []

        content {
          kms_key_id = try(var.execute_command_configuration.kms_key_id, null)
          logging    = try(var.execute_command_configuration.logging, null)

          dynamic "log_configuration" {
            for_each = try(var.execute_command_configuration.log_configuration, null) != null ? [1] : []

            content {
              cloud_watch_encryption_enabled = try(var.execute_command_configuration.log_configuration.cloud_watch_encryption_enabled, null)
              cloud_watch_log_group_name     = try(var.execute_command_configuration.log_configuration.cloud_watch_log_group_name, null)
              s3_bucket_name                 = try(var.execute_command_configuration.log_configuration.s3_bucket_name, null)
              s3_bucket_encryption_enabled   = try(var.execute_command_configuration.log_configuration.s3_bucket_encryption_enabled, null)
              s3_key_prefix                  = try(var.execute_command_configuration.log_configuration.s3_key_prefix, null)
            }
          }
        }
      }
    }
  }

  dynamic "service_connect_defaults" {
    for_each = var.service_connect_defaults != null ? [1] : []

    content {
      namespace = var.service_connect_defaults.namespace
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
