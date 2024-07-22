<!-- BEGIN_TF_DOCS -->
# terraform-aws-ecs

A Terraform module to create ECS Cluster that relies on self-managed EC2 instances.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS Cluster to create | `string` | n/a | yes |
| <a name="input_execute_command_configuration"></a> [execute\_command\_configuration](#input\_execute\_command\_configuration) | Details of the execute command configuration | <pre>object({<br>    kms_key_id = optional(string)<br>    logging    = optional(string)<br>    log_configuration = optional(object({<br>      cloud_watch_encryption_enabled = optional(bool)<br>      cloud_watch_log_group_name     = optional(string)<br>      s3_bucket_name                 = optional(string)<br>      s3_bucket_encryption_enabled   = optional(bool)<br>      s3_key_prefix                  = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_service_connect_defaults"></a> [service\_connect\_defaults](#input\_service\_connect\_defaults) | Default Service Connect namespace | <pre>object({<br>    namespace = string<br>  })</pre> | `null` | no |
| <a name="input_setting"></a> [setting](#input\_setting) | Details of the setting configuration | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags for ECS Cluster | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the ECS Cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Identifier of the ECS Cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
