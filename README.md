<!-- BEGIN_TF_DOCS -->
# terraform-aws-ecs-ec2

## Notice

This module depends on and includes configuration for the [terraform-aws-ecs](https://github.com/terraform-aws-modules/terraform-aws-ecs), which is licensed under the Apache License 2.0. You can find the original license in the `LICENSE` file of the public module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws//modules/cluster | ~> 5.11.3 |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | terraform-aws-modules/ecs/aws//modules/service | ~> 5.11.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_arn"></a> [cluster\_arn](#input\_cluster\_arn) | ARN of the ECS cluster under which the service will be created | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS Cluster to create | `string` | `""` | no |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | Resource Tags for ECS Cluster | `map(any)` | `{}` | no |
| <a name="input_create_cluster"></a> [create\_cluster](#input\_create\_cluster) | Creates an ECS cluster | `bool` | `true` | no |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | CPU allocation for ECS task definitions | `number` | n/a | yes |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Memory allocation for ECS task definitions | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the ECS Service | `string` | n/a | yes |
| <a name="input_service_subnet_ids"></a> [service\_subnet\_ids](#input\_service\_subnet\_ids) | VPC subnet ids where the ECS services will be deployed | `list(string)` | n/a | yes |
| <a name="input_service_tags"></a> [service\_tags](#input\_service\_tags) | Resource Tags for ECS Service | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the ECS Cluster |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | Identifier of the ECS Service |
<!-- END_TF_DOCS -->
