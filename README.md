<!-- BEGIN_TF_DOCS -->
# terraform-aws-ecs

A Terraform module to create ECS Cluster that relies on self-managed EC2 instances.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg"></a> [asg](#module\_asg) | ./modules/asg | n/a |
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./modules/cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_create_launch_template"></a> [asg\_create\_launch\_template](#input\_asg\_create\_launch\_template) | Either to create a Launch Template to associate with the Autoscaling group | `bool` | `true` | no |
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | Desired capacity for the Autoscaling group | `number` | n/a | yes |
| <a name="input_asg_iam_instance_profile_name"></a> [asg\_iam\_instance\_profile\_name](#input\_asg\_iam\_instance\_profile\_name) | Name of the IAM Instance Profile | `string` | `null` | no |
| <a name="input_asg_iam_instance_profile_tags"></a> [asg\_iam\_instance\_profile\_tags](#input\_asg\_iam\_instance\_profile\_tags) | Resource Tags for the IAM Instance Profile | `map(any)` | `{}` | no |
| <a name="input_asg_iam_role_name"></a> [asg\_iam\_role\_name](#input\_asg\_iam\_role\_name) | Name for the IAM Role | `string` | `null` | no |
| <a name="input_asg_iam_role_policy_attachments"></a> [asg\_iam\_role\_policy\_attachments](#input\_asg\_iam\_role\_policy\_attachments) | Policy ARNs to attach to the IAM Role | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"<br>]</pre> | no |
| <a name="input_asg_iam_role_tags"></a> [asg\_iam\_role\_tags](#input\_asg\_iam\_role\_tags) | Resource Tags for IAM Role | `map(any)` | `{}` | no |
| <a name="input_asg_instances_tags"></a> [asg\_instances\_tags](#input\_asg\_instances\_tags) | Resources Tags to propagate to the Instances | `map(any)` | `{}` | no |
| <a name="input_asg_launch_template"></a> [asg\_launch\_template](#input\_asg\_launch\_template) | Launch Template to use with the Autoscaling group | <pre>object({<br>    name                   = optional(string, null)<br>    image_id               = optional(string, null)<br>    instance_type          = optional(string, null)<br>    vpc_security_group_ids = optional(list(string), [])<br>    key_name               = optional(string, null)<br>    user_data              = optional(string, null)<br>    tags                   = optional(map(any), {})<br>  })</pre> | `{}` | no |
| <a name="input_asg_launch_template_id"></a> [asg\_launch\_template\_id](#input\_asg\_launch\_template\_id) | Identifier of the Launch Template | `string` | `null` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | Max. size for the Autoscaling group | `number` | n/a | yes |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | Min. size for the Autoscaling group | `number` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | Name of the Autoscaling Group | `string` | n/a | yes |
| <a name="input_asg_tags"></a> [asg\_tags](#input\_asg\_tags) | Resources Tags for Autoscaling group | `map(any)` | `{}` | no |
| <a name="input_asg_vpc_zone_identifier"></a> [asg\_vpc\_zone\_identifier](#input\_asg\_vpc\_zone\_identifier) | Identifiers of the VPC Subnets | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS Cluster to create | `string` | n/a | yes |
| <a name="input_cluster_setting"></a> [cluster\_setting](#input\_cluster\_setting) | Details of the setting configuration | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | Resource Tags for ECS Cluster | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_arn"></a> [asg\_arn](#output\_asg\_arn) | ARN of the Autoscaling group |
| <a name="output_asg_iam_instance_profile_arn"></a> [asg\_iam\_instance\_profile\_arn](#output\_asg\_iam\_instance\_profile\_arn) | ARN of the IAM Instance Profile being used with the Launch Template |
| <a name="output_asg_iam_instance_profile_id"></a> [asg\_iam\_instance\_profile\_id](#output\_asg\_iam\_instance\_profile\_id) | Identifier of the IAM Instance Profile being used with the Launch Template |
| <a name="output_asg_iam_role_id"></a> [asg\_iam\_role\_id](#output\_asg\_iam\_role\_id) | Identifier of the IAM Role being used with the IAM Instnace Profile |
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | Identifier of the Autoscaling group |
| <a name="output_asg_launch_template_arn"></a> [asg\_launch\_template\_arn](#output\_asg\_launch\_template\_arn) | ARN of the Launch Template being used with the Autoscaling Group |
| <a name="output_asg_launch_template_id"></a> [asg\_launch\_template\_id](#output\_asg\_launch\_template\_id) | Identifier of the Launch Template being used with the Autoscaling Group |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the ECS Cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Identifier of the ECS Cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
