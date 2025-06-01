resource "aws_ecs_service" "medusa-cluster-service" {
  name            = "cluster-service"
  cluster         = aws_ecs_cluster.medusa-cluster.id
  task_definition = aws_ecs_task_definition.TD.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_id
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "medusa"
    container_port   = 9000
  }
}
