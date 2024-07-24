<!-- BEGIN_TF_DOCS -->
# ECS Complete

Configuration in this directory creates:

- ECS Cluster using self-managed EC2
- Autoscaling Group with self-managed EC2 for the created ECS Cluster

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

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN that identifies the cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS Cluster |
<!-- END_TF_DOCS -->
