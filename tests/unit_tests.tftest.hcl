###########################################################
# ECS Cluster Tests
###########################################################

run "cluster_name_match" {
  command = plan

  module {
    source = "./"
  }

  variables {
    cluster_name = "test-cluster"
  }

  assert {
    condition     = module.ecs_cluster.name == var.cluster_name
    error_message = "ECS Cluster name mismatch after creation"
  }
}
