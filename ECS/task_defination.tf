resource "aws_ecs_task_definition" "TD" {
  family                   = "medusa-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  container_definitions = jsonencode([
    {
      name  = "medusa"
      image = "booraraman/easy-drive-rentals:v1.1"
      essential = true
      portMappings = [
        {
          containerPort = 6500
          hostPort      = 6500
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/medusa-service"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "medusa"
          "awslogs-create-group"  = "true"
        }
      }
    }
  ])

  lifecycle {
    create_before_destroy = true
  }
}