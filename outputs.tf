output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "alb_dns_name" {
  value = module.alb_asg.alb_dns_name
}

