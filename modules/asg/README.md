<!-- BEGIN_TF_DOCS -->
# asg

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS Cluster to associate with the Autoscaling Group | `string` | n/a | yes |
| <a name="input_create_launch_template"></a> [create\_launch\_template](#input\_create\_launch\_template) | Either to create a Launch Template to associate with the Autoscaling group | `bool` | `true` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the group. | `number` | n/a | yes |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | (Optional) "EC2" or "ELB". Controls how health checking is done. | `string` | `"EC2"` | no |
| <a name="input_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#input\_iam\_instance\_profile\_name) | (Optional, Forces new resource) Name of the instance profile. | `string` | `null` | no |
| <a name="input_iam_instance_profile_tags"></a> [iam\_instance\_profile\_tags](#input\_iam\_instance\_profile\_tags) | (Optional) Map of resource tags for the IAM Instance Profile. | `map(string)` | `{}` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | (Optional, Forces new resource) Friendly name of the role. | `string` | `null` | no |
| <a name="input_iam_role_policy_attachments"></a> [iam\_role\_policy\_attachments](#input\_iam\_role\_policy\_attachments) | (Required) - The ARN of the policy you want to apply | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"<br>]</pre> | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `{}` | no |
| <a name="input_instances_tags"></a> [instances\_tags](#input\_instances\_tags) | Resources Tags to propagate to the Instances | `map(string)` | `{}` | no |
| <a name="input_launch_template"></a> [launch\_template](#input\_launch\_template) | Launch Template to use with the Autoscaling group | <pre>object({<br>    name = optional(string, null)<br>    block_device_mappings = optional(list(object({<br>      device_name = string<br>      ebs = optional(object({<br>        delete_on_termination = optional(bool, null)<br>        snapshot_id           = optional(string, null)<br>        volume_size           = optional(number, null)<br>        volume_type           = optional(string, null)<br>      }))<br>      no_device    = optional(any, null)<br>      virtual_name = optional(string, null)<br>    })), [])<br>    image_id               = optional(string, null)<br>    instance_type          = optional(string, null)<br>    vpc_security_group_ids = optional(list(string), [])<br>    key_name               = optional(string, null)<br>    user_data              = optional(string, null)<br>    tags                   = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_launch_template_id"></a> [launch\_template\_id](#input\_launch\_template\_id) | Identifier of the Launch Template | `string` | `null` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Name of the Auto Scaling Group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resources Tags for Autoscaling group | `map(string)` | `{}` | no |
| <a name="input_vpc_zone_identifier"></a> [vpc\_zone\_identifier](#input\_vpc\_zone\_identifier) | (Optional) List of subnet IDs to launch resources in. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN for this Auto Scaling Group. |
| <a name="output_iam_instance_profile_arn"></a> [iam\_instance\_profile\_arn](#output\_iam\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile. |
| <a name="output_iam_instance_profile_id"></a> [iam\_instance\_profile\_id](#output\_iam\_instance\_profile\_id) | Instance profile's ID. |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | Name of the role. |
| <a name="output_id"></a> [id](#output\_id) | Auto Scaling Group id. |
| <a name="output_launch_template_arn"></a> [launch\_template\_arn](#output\_launch\_template\_arn) | Amazon Resource Name (ARN) of the launch template. |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | The ID of the launch template. |
<!-- END_TF_DOCS -->
