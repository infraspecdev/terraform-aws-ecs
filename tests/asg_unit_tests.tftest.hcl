provider "aws" {
  region = "ap-south-1"
}

################################################################################
# Autoscaling Group
################################################################################

run "asg_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    create_launch_template  = false
    launch_template_id      = "lt-068f72b729example"
    launch_template_version = "$Default"

    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]

    instances_tags = {
      Example = "InstanceTag"
    }
    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = aws_autoscaling_group.this.name == var.name
    error_message = "Name mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.vpc_zone_identifier == toset(var.vpc_zone_identifier)
    error_message = "VPC Zone Identifier mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.desired_capacity == var.desired_capacity
    error_message = "Desired capacity mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.min_size == var.min_size
    error_message = "Min. size mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.max_size == var.max_size
    error_message = "Max. size mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.protect_from_scale_in == false
    error_message = "Protect from scale in mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.health_check_type == var.health_check_type
    error_message = "Health check type mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.launch_template[0].id == var.launch_template_id
    error_message = "Launch template id mismatch"
  }

  assert {
    condition     = aws_autoscaling_group.this.launch_template[0].version == var.launch_template_version
    error_message = "Launch template version mismatch"
  }

  assert {
    condition     = length(aws_launch_template.this) == 0
    error_message = "Launch template was created"
  }

  assert {
    condition = alltrue([
      for instance_tag in tolist(aws_autoscaling_group.this.tag) :
      !instance_tag.propagate_at_launch || (
        lookup(var.instances_tags, instance_tag.key, null) != null &&
        try(var.instances_tags[instance_tag.key], null) == instance_tag.value
      )
    ])
    error_message = "Instances tags mismatch"
  }

  assert {
    condition = alltrue([
      for instance_tag in tolist(aws_autoscaling_group.this.tag) :
      instance_tag.propagate_at_launch || (
        lookup(var.tags, instance_tag.key, null) != null &&
        try(var.tags[instance_tag.key], null) == instance_tag.value
      )
    ])
    error_message = "Tags mismatch"
  }
}

################################################################################
# Launch Template
################################################################################

run "launch_template_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    launch_template = {
      name                   = "example_launch_template"
      image_id               = "ami-123456789012345"
      instance_type          = "example_instance_type"
      vpc_security_group_ids = ["sg-123456789012345", "sg-123456789012346"]
      key_name               = "example_key"

      block_device_mappings = [
        {
          device_name  = "example-device-name"
          no_device    = "example-no-device"
          virtual_name = "example-virtual-name"

          ebs = {
            delete_on_termination = true
            snapshot_id           = "snap-1234567890abcdef0"
            volume_size           = 70
            volume_type           = "gp3"
          }
        }
      ]

      user_data = "example_user_data"

      tags = {
        Example = "Tag"
      }
    }

    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]
  }

  assert {
    condition     = aws_launch_template.this[0].name == var.launch_template.name
    error_message = "Name mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].image_id == var.launch_template.image_id
    error_message = "Image id mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].instance_type == var.launch_template.instance_type
    error_message = "Instance type mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].vpc_security_group_ids == toset(var.launch_template.vpc_security_group_ids)
    error_message = "VPC Security group ids mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].key_name == var.launch_template.key_name
    error_message = "Key name mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].device_name == var.launch_template.block_device_mappings[0].device_name
    error_message = "Block Device Mappings Device name mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].no_device == var.launch_template.block_device_mappings[0].no_device
    error_message = "Block Device Mappings No device mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].virtual_name == var.launch_template.block_device_mappings[0].virtual_name
    error_message = "Block Device Mappings Virtual name mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].ebs[0].delete_on_termination == tostring(var.launch_template.block_device_mappings[0].ebs.delete_on_termination)
    error_message = "Block Device Mappings EBS Delete on termination mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].ebs[0].snapshot_id == tostring(var.launch_template.block_device_mappings[0].ebs.snapshot_id)
    error_message = "Block Device Mappings EBS Snapshot ID mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].ebs[0].volume_size == var.launch_template.block_device_mappings[0].ebs.volume_size
    error_message = "Block Device Mappings EBS Volume size mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].block_device_mappings[0].ebs[0].volume_type == var.launch_template.block_device_mappings[0].ebs.volume_type
    error_message = "Block Device Mappings EBS Volume type mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].user_data == base64encode(var.launch_template.user_data)
    error_message = "User data mismatch"
  }

  assert {
    condition     = aws_launch_template.this[0].tags == var.launch_template.tags
    error_message = "Tags mismatch"
  }
}

################################################################################
# IAM Instance Profile
################################################################################

run "iam_policy_document_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    create_launch_template = false
    launch_template_id     = "lt-068f72b729example"

    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]

    instances_tags = {
      Example = "InstanceTag"
    }
    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = data.aws_iam_policy_document.this.statement[0].actions == toset(["sts:AssumeRole"])
    error_message = "Name mismatch"
  }

  assert {
    condition     = tolist(data.aws_iam_policy_document.this.statement[0].principals)[0].type == "Service"
    error_message = "Principal type mismatch"
  }

  assert {
    condition     = tolist(data.aws_iam_policy_document.this.statement[0].principals)[0].identifiers == toset(["ec2.amazonaws.com"])
    error_message = "Principal identifiers mismatch"
  }
}

run "iam_role_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    create_launch_template = false
    launch_template_id     = "lt-068f72b729example"

    iam_role_name = "example-iam-role-name"
    iam_role_tags = {
      ExampleIAM = "RoleTags"
    }
    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]

    instances_tags = {
      Example = "InstanceTag"
    }
    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = aws_iam_role.this.name == var.iam_role_name
    error_message = "Name mismatch"
  }

  assert {
    condition     = jsondecode(aws_iam_role.this.assume_role_policy) == jsondecode(data.aws_iam_policy_document.this.json)
    error_message = "EC2 container service role mismatch"
  }

  assert {
    condition     = aws_iam_role.this.tags == var.iam_role_tags
    error_message = "Tags mismatch"
  }
}

run "iam_role_policy_attachments_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    create_launch_template = false
    launch_template_id     = "lt-068f72b729example"

    iam_role_name = "example-iam-role-name"
    iam_role_tags = {
      ExampleIAM = "RoleTags"
    }
    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]

    instances_tags = {
      Example = "InstanceTag"
    }
    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = length(aws_iam_role_policy_attachment.this) == 1
    error_message = "IAM role policy attachment was not created"
  }

  assert {
    condition     = aws_iam_role_policy_attachment.this[0].role == aws_iam_role.this.name
    error_message = "Role mismatch"
  }

  assert {
    condition     = aws_iam_role_policy_attachment.this[0].policy_arn == var.iam_role_policy_attachments[0]
    error_message = "Policy ARN mismatch"
  }
}

run "iam_instance_profile_attributes_match" {
  command = plan

  module {
    source = "./modules/asg"
  }

  variables {
    cluster_name = "example-cluster-name"

    name                = "example-asg-name"
    vpc_zone_identifier = ["subnet-12345678901234", "subnet-12345678901235"]
    desired_capacity    = 7
    min_size            = 1
    max_size            = 10
    health_check_type   = "ELB"

    create_launch_template = false
    launch_template_id     = "lt-068f72b729example"

    iam_role_name = "example-iam-role-name"
    iam_role_tags = {
      ExampleIAM = "RoleTags"
    }
    iam_role_policy_attachments = [
      "arn:aws:iam::aws:policy/abcd/efgh"
    ]

    iam_instance_profile_name = "example-iam-instance-profile-name"
    iam_instance_profile_tags = {
      ExampleIAM = "InstanceProfileTag"
    }

    instances_tags = {
      Example = "InstanceTag"
    }
    tags = {
      Example = "Tag"
    }
  }

  assert {
    condition     = aws_iam_instance_profile.this.name == var.iam_instance_profile_name
    error_message = "Name mismatch"
  }

  assert {
    condition     = aws_iam_instance_profile.this.role == aws_iam_role.this.name
    error_message = "Role mismatch"
  }

  assert {
    condition     = aws_iam_instance_profile.this.tags == var.iam_instance_profile_tags
    error_message = "Tags mismatch"
  }
}
