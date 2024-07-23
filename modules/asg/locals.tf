locals {
  launch_template_user_data = try(var.launch_template.user_data, null) != null ? base64encode(var.launch_template.user_data) : base64encode(
    <<-USERDATA
      #!/bin/bash
      echo ECS_CLUSTER="${var.cluster_name}" >> /etc/ecs/ecs.config
    USERDATA
  )
}
