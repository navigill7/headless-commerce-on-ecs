provider "aws" {
  region = "us-east-1"
}

module "Vpc-ubnets" {
  source = "./Networking"
}

module "Iam_roles" {
  source = "./IAM_ROLE"
}

module "alb" {
  source            = "./ALB"
  vpc_id            = module.Vpc-ubnets.vpc_id
  subnet_ids        = module.Vpc-ubnets.subnet_ids
  security_group_id = toset([module.Vpc-ubnets.allow_tls_sg_id])
}

module "ecs" {
  source            = "./ECS"
  execution_role_arn = module.Iam_roles.iam-role
  target_group_arn  = module.alb.target_group_arn
  subnet_ids        = module.Vpc-ubnets.subnet_ids
  security_group_id = toset([module.Vpc-ubnets.allow_tls_sg_id])
  vpc_id            = module.Vpc-ubnets.vpc_id
  depends_on = [module.alb]
}

output "dns" {
    value = module.alb.alb_dns_name
}
  