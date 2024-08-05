<!-- BEGIN_TF_DOCS -->
# terraform-aws-ecs

A Terraform module to create ECS Cluster that relies on self-managed EC2 instances.

## Architecture Diagram

![ECS Architecture Diagram](https://github.com/infraspecdev/terraform-aws-ecs/raw/main/diagrams/ecs-architecture.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

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
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the group. | `number` | n/a | yes |
| <a name="input_asg_health_check_type"></a> [asg\_health\_check\_type](#input\_asg\_health\_check\_type) | (Optional) "EC2" or "ELB". Controls how health checking is done. | `string` | `null` | no |
| <a name="input_asg_iam_instance_profile_name"></a> [asg\_iam\_instance\_profile\_name](#input\_asg\_iam\_instance\_profile\_name) | (Optional, Forces new resource) Name of the instance profile. | `string` | `null` | no |
| <a name="input_asg_iam_instance_profile_tags"></a> [asg\_iam\_instance\_profile\_tags](#input\_asg\_iam\_instance\_profile\_tags) | (Optional) Map of resource tags for the IAM Instance Profile. | `map(string)` | `{}` | no |
| <a name="input_asg_iam_role_name"></a> [asg\_iam\_role\_name](#input\_asg\_iam\_role\_name) | (Optional, Forces new resource) Friendly name of the role. | `string` | `null` | no |
| <a name="input_asg_iam_role_policy_attachments"></a> [asg\_iam\_role\_policy\_attachments](#input\_asg\_iam\_role\_policy\_attachments) | (Required) - The ARN of the policy you want to apply | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"<br>]</pre> | no |
| <a name="input_asg_iam_role_tags"></a> [asg\_iam\_role\_tags](#input\_asg\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `{}` | no |
| <a name="input_asg_instances_tags"></a> [asg\_instances\_tags](#input\_asg\_instances\_tags) | Resources Tags to propagate to the Instances | `map(string)` | `{}` | no |
| <a name="input_asg_launch_template"></a> [asg\_launch\_template](#input\_asg\_launch\_template) | Launch Template to use with the Autoscaling group | <pre>object({<br>    name = optional(string, null)<br>    block_device_mappings = optional(list(object({<br>      device_name = string<br>      ebs = optional(object({<br>        delete_on_termination = optional(bool, null)<br>        snapshot_id           = optional(string, null)<br>        volume_size           = optional(number, null)<br>        volume_type           = optional(string, null)<br>      }))<br>      no_device    = optional(any, null)<br>      virtual_name = optional(string, null)<br>    })), [])<br>    image_id               = optional(string, null)<br>    instance_type          = optional(string, null)<br>    vpc_security_group_ids = optional(list(string), [])<br>    key_name               = optional(string, null)<br>    user_data              = optional(string, null)<br>    tags                   = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_asg_launch_template_id"></a> [asg\_launch\_template\_id](#input\_asg\_launch\_template\_id) | Identifier of the Launch Template | `string` | `null` | no |
| <a name="input_asg_launch_template_version"></a> [asg\_launch\_template\_version](#input\_asg\_launch\_template\_version) | (Optional) Template version. | `string` | `null` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | Maximum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | Minimum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | (Optional) Name of the Auto Scaling Group. | `string` | n/a | yes |
| <a name="input_asg_protect_from_scale_in"></a> [asg\_protect\_from\_scale\_in](#input\_asg\_protect\_from\_scale\_in) | (Optional) Whether newly launched instances are automatically protected from termination by Amazon EC2 Auto Scaling when scaling in. | `bool` | `null` | no |
| <a name="input_asg_tags"></a> [asg\_tags](#input\_asg\_tags) | Resources Tags for Autoscaling group | `map(string)` | `{}` | no |
| <a name="input_asg_vpc_zone_identifier"></a> [asg\_vpc\_zone\_identifier](#input\_asg\_vpc\_zone\_identifier) | (Optional) List of subnet IDs to launch resources in. | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Required) Name of the cluster | `string` | n/a | yes |
| <a name="input_cluster_service_connect_namespace"></a> [cluster\_service\_connect\_namespace](#input\_cluster\_service\_connect\_namespace) | (Required) ARN of the aws\_service\_discovery\_http\_namespace that's used when you create a service and don't specify a Service Connect configuration. | `string` | `null` | no |
| <a name="input_cluster_setting"></a> [cluster\_setting](#input\_cluster\_setting) | (Optional) Configuration block(s) with cluster settings. | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_arn"></a> [asg\_arn](#output\_asg\_arn) | ARN for this Auto Scaling Group. |
| <a name="output_asg_iam_instance_profile_arn"></a> [asg\_iam\_instance\_profile\_arn](#output\_asg\_iam\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile. |
| <a name="output_asg_iam_instance_profile_id"></a> [asg\_iam\_instance\_profile\_id](#output\_asg\_iam\_instance\_profile\_id) | Instance profile's ID. |
| <a name="output_asg_iam_role_id"></a> [asg\_iam\_role\_id](#output\_asg\_iam\_role\_id) | Name of the role. |
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | Auto Scaling Group id. |
| <a name="output_asg_launch_template_arn"></a> [asg\_launch\_template\_arn](#output\_asg\_launch\_template\_arn) | Amazon Resource Name (ARN) of the launch template. |
| <a name="output_asg_launch_template_id"></a> [asg\_launch\_template\_id](#output\_asg\_launch\_template\_id) | The ID of the launch template. |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN that identifies the cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Identifier of the ECS Cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
