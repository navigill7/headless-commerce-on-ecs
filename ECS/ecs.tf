resource "aws_ecs_cluster" "medusa-cluster" {
  name = "medusa-deployment-cluster"
  tags = {
    name = "medusa-deployment-cluster"
  }
}