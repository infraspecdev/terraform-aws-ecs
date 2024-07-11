# ECS EC2 Complete

Configuration in this directory creates:

- ECS Cluster using self-managed EC2
- ECS Service configured for running Tasks on self-managed EC2

## Usage

To run this example, you will need to execute the commands:

```bash
terraform init
terraform plan
terraform apply
```

Please note that this example may create resources that can incur monetary charges on your AWS bill. You can run `terraform destroy` when you no longer need the resources.
