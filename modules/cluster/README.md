<!-- BEGIN_TF_DOCS -->
# cluster

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the ECS Cluster to create | `string` | n/a | yes |
| <a name="input_service_connect_namespace"></a> [service\_connect\_namespace](#input\_service\_connect\_namespace) | (Required) ARN of the aws\_service\_discovery\_http\_namespace that's used when you create a service and don't specify a Service Connect configuration. | `string` | `null` | no |
| <a name="input_setting"></a> [setting](#input\_setting) | Details of the setting configuration | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags for ECS Cluster | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the ECS Cluster |
| <a name="output_id"></a> [id](#output\_id) | Identifier of the ECS Cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
