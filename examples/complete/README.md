
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.57.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ../../ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.9.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | ARN of the ECS Cluster |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Identifiers of the Private Subnets |
| <a name="output_private_subnets_arns"></a> [private\_subnets\_arns](#output\_private\_subnets\_arns) | ARNs of the Private Subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | CIDR Blocks of the Private Subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Identifiers of the Public Subnets |
| <a name="output_public_subnets_arns"></a> [public\_subnets\_arns](#output\_public\_subnets\_arns) | ARNs of the Public Subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | CIDR Blocks of the Public Subnets |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | CIDR Block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Identifier of the VPC |
<!-- END_TF_DOCS -->
