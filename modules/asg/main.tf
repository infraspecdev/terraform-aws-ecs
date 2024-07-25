resource "aws_autoscaling_group" "this" {
  name                = var.name
  vpc_zone_identifier = var.vpc_zone_identifier

  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  protect_from_scale_in = var.protect_from_scale_in
  health_check_type     = var.health_check_type

  launch_template {
    id      = var.create_launch_template ? aws_launch_template.this[0].id : var.launch_template_id
    version = var.launch_template_version != null ? var.launch_template_version : null
  }

  dynamic "tag" {
    for_each = var.instances_tags
    iterator = tag

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  dynamic "tag" {
    for_each = var.tags
    iterator = tag

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = false
    }
  }
}

################################################################################
# Launch Template
################################################################################

resource "aws_launch_template" "this" {
  count = var.create_launch_template ? 1 : 0

  name                   = var.launch_template.name
  image_id               = var.launch_template.image_id
  instance_type          = var.launch_template.instance_type
  vpc_security_group_ids = var.launch_template.vpc_security_group_ids
  key_name               = var.launch_template.key_name

  dynamic "block_device_mappings" {
    for_each = try(var.launch_template.block_device_mappings, [])
    iterator = block_device_mappings

    content {
      device_name  = block_device_mappings.value.device_name
      no_device    = block_device_mappings.value.no_device
      virtual_name = block_device_mappings.value.virtual_name

      dynamic "ebs" {
        for_each = try(block_device_mappings.value.ebs, null) != null ? [1] : []

        content {
          delete_on_termination = block_device_mappings.value.ebs.delete_on_termination
          snapshot_id           = block_device_mappings.value.ebs.snapshot_id
          volume_size           = block_device_mappings.value.ebs.volume_size
          volume_type           = block_device_mappings.value.ebs.volume_type
        }
      }
    }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.this.name
  }
  user_data = local.launch_template_user_data

  tags = var.launch_template.tags
}

################################################################################
# IAM Instance Profile
################################################################################

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.this.json

  tags = var.iam_role_tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.iam_role_policy_attachments)

  role       = aws_iam_role.this.name
  policy_arn = element(var.iam_role_policy_attachments, count.index)
}

resource "aws_iam_instance_profile" "this" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.this.name

  tags = var.iam_instance_profile_tags
}
