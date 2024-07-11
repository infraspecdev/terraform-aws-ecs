###########################################################
# ECS Cluster Tests
###########################################################

run "do_not_create_cluster_when_false" {
  command = plan

  module {
    source = "./"
  }

  variables {
    create_cluster = false

    service_name       = "test-service"
    cluster_arn        = "arn:aws:ecs:ap-south-1:471112575944:cluster/default"
    service_subnet_ids = ["subnet-0ba38303b254c0785"]
    service_cpu        = 128
    service_memory     = 256
  }

  assert {
    condition     = length(module.ecs_cluster) == 0
    error_message = "ECS cluster was created even after setting `create_cluster` to `false`"
  }
}

run "create_cluster_when_true" {
  command = plan

  module {
    source = "./"
  }

  variables {
    create_cluster = true
    cluster_name   = "test-cluster"

    service_name       = "test-service"
    service_subnet_ids = ["subnet-0ba38303b254c0785"]
    service_cpu        = 128
    service_memory     = 256
  }

  assert {
    condition     = length(module.ecs_cluster) == 1
    error_message = "ECS cluster was not created even after setting `create_cluster` to `true`"
  }
}

run "cluster_name_match" {
  command = plan

  module {
    source = "./"
  }

  variables {
    create_cluster = true
    cluster_name   = "test-cluster"

    service_name       = "test-service"
    service_subnet_ids = ["subnet-0ba38303b254c0785"]
    service_cpu        = 128
    service_memory     = 256
  }

  assert {
    condition     = module.ecs_cluster[0].name == var.cluster_name
    error_message = "ECS Cluster name mismatch after creation"
  }
}

###########################################################
# ECS Service Tests
###########################################################

run "service_name_match" {
  command = plan

  module {
    source = "./"
  }

  variables {
    create_cluster = true
    cluster_name   = "test-cluster"

    service_name       = "test-service"
    service_subnet_ids = ["subnet-0ba38303b254c0785"]
    service_cpu        = 128
    service_memory     = 256
  }

  assert {
    condition     = module.ecs_service.name == var.service_name
    error_message = "ECS Cluster name mismatch after creation"
  }
}
