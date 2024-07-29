<!-- BEGIN_TF_DOCS -->
# ECS Complete

Configuration in this directory creates:

- ECS Cluster using self-managed EC2
- Autoscaling Group with self-managed EC2 for the created ECS Cluster

## Example tfvars file

```text
cluster_name = "cluster"
cluster_setting = [
  {
    name  = "containerInsights"
    value = "enabled"
  }
]
cluster_tags = {
  Project = "project"
}

# Autoscaling Group Variables
asg_name                = "my-asg"
asg_vpc_zone_identifier = ["subnet-1341324123", "subnet-13241234123"]
asg_desired_capacity    = 2
asg_min_size            = 1
asg_max_size            = 3
asg_instances_tags = {
  Name = "instance"
}
asg_tags = {
  Project = "project"
}

# Launch Template Variables
asg_create_launch_template = true
asg_launch_template = {
  image_id           = "ami-068e0f1a600cd311c"
  instance_type      = "t2.micro"
  key_name           = "<actual-key-name>"
  security_group_ids = []
}
asg_launch_template_version = "<actual-version>"

# IAM Role Variables
asg_iam_role_name = "asg-role"
asg_iam_role_tags = {
  Project = "project"
}

# IAM Instance Profile Variables
asg_iam_instance_profile_name = "asg-instance-profile"
asg_iam_instance_profile_tags = {
  Project = "project"
}
```

## Usage

To run this example, you will need to execute the commands:

```bash
terraform init
terraform plan
terraform apply
```

Please note that this example may create resources that can incur monetary charges on your AWS bill. You can run `terraform destroy` when you no longer need the resources.

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
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_create_launch_template"></a> [asg\_create\_launch\_template](#input\_asg\_create\_launch\_template) | Whether to create a launch template. | `bool` | n/a | yes |
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the Auto Scaling Group. | `number` | n/a | yes |
| <a name="input_asg_iam_instance_profile_name"></a> [asg\_iam\_instance\_profile\_name](#input\_asg\_iam\_instance\_profile\_name) | The name of the IAM instance profile for the Auto Scaling Group. | `string` | n/a | yes |
| <a name="input_asg_iam_instance_profile_tags"></a> [asg\_iam\_instance\_profile\_tags](#input\_asg\_iam\_instance\_profile\_tags) | A map of tags to assign to the IAM instance profile. | `map(string)` | n/a | yes |
| <a name="input_asg_iam_role_name"></a> [asg\_iam\_role\_name](#input\_asg\_iam\_role\_name) | The name of the IAM role for the Auto Scaling Group. | `string` | n/a | yes |
| <a name="input_asg_iam_role_tags"></a> [asg\_iam\_role\_tags](#input\_asg\_iam\_role\_tags) | A map of tags to assign to the IAM role. | `map(string)` | n/a | yes |
| <a name="input_asg_instances_tags"></a> [asg\_instances\_tags](#input\_asg\_instances\_tags) | A map of tags to assign to the instances within the Auto Scaling Group. | `map(string)` | n/a | yes |
| <a name="input_asg_launch_template"></a> [asg\_launch\_template](#input\_asg\_launch\_template) | The configuration of the launch template. | <pre>object({<br>    image_id           = string<br>    instance_type      = string<br>    key_name           = string<br>    security_group_ids = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_asg_launch_template_version"></a> [asg\_launch\_template\_version](#input\_asg\_launch\_template\_version) | The version of the launch template to use. | `string` | n/a | yes |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | The maximum size of the Auto Scaling Group. | `number` | n/a | yes |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | The minimum size of the Auto Scaling Group. | `number` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | The name of the Auto Scaling Group. | `string` | n/a | yes |
| <a name="input_asg_tags"></a> [asg\_tags](#input\_asg\_tags) | A map of tags to assign to the Auto Scaling Group. | `map(string)` | n/a | yes |
| <a name="input_asg_vpc_zone_identifier"></a> [asg\_vpc\_zone\_identifier](#input\_asg\_vpc\_zone\_identifier) | A list of subnet IDs to launch resources in. | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the ECS cluster. | `string` | n/a | yes |
| <a name="input_cluster_setting"></a> [cluster\_setting](#input\_cluster\_setting) | The settings to use when creating the cluster. | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | A map of tags to assign to the cluster. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN that identifies the cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
