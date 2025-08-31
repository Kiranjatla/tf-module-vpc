output "subnets" {
  value = module.lm-subnets
}

output "rt" {
  value = [for i,j in aws_route_table.aws_route_table : j.id]
}