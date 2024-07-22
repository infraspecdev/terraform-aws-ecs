provider "aws" {
  region = "ap-south-1"
}

###########################################################
# ECS Cluster
###########################################################

run "ecs_cluster_attributes_match" {
  command = plan

  module {
    source = "./"
  }

  variables {
    cluster_name = "example-cluster-name"

    execute_command_configuration = {
      kms_key_id = "example-key-id"
      logging    = "DEFAULT"

      log_configuration = {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = "example-cloudwatch-group-name"
        s3_bucket_name                 = "example-bucket"
        s3_bucket_encryption_enabled   = true
        s3_key_prefix                  = "example-key-prefix"
      }
    }

    service_connect_defaults = {
      namespace = "arn:aws:cloudmap:us-west-2:123456789012:namespace/ns-1234567890123456"
    }

    setting = [
      {
        name  = "containerInsights"
        value = "enabled"
      }
    ]

    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = aws_ecs_cluster.this.name == var.cluster_name
    error_message = "Name mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].kms_key_id == var.execute_command_configuration.kms_key_id
    error_message = "KMS Key ID mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].logging == var.execute_command_configuration.logging
    error_message = "Logging mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].log_configuration[0].cloud_watch_encryption_enabled == var.execute_command_configuration.log_configuration.cloud_watch_encryption_enabled
    error_message = "CloudWatch Encryption status mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].log_configuration[0].cloud_watch_log_group_name == var.execute_command_configuration.log_configuration.cloud_watch_log_group_name
    error_message = "CloudWatch Log group name mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].log_configuration[0].s3_bucket_name == var.execute_command_configuration.log_configuration.s3_bucket_name
    error_message = "S3 Bucket name mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].log_configuration[0].s3_bucket_encryption_enabled == var.execute_command_configuration.log_configuration.s3_bucket_encryption_enabled
    error_message = "S3 Bucket Encryption status mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.configuration[0].execute_command_configuration[0].log_configuration[0].s3_key_prefix == var.execute_command_configuration.log_configuration.s3_key_prefix
    error_message = "S3 Key Prefix mismatch"
  }

  assert {
    condition     = aws_ecs_cluster.this.service_connect_defaults[0].namespace == var.service_connect_defaults.namespace
    error_message = "Namespace mismatch"
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
