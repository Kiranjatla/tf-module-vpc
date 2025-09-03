output "private_subnets" {
  value = module.private_subnets
}

output "public_subnets" {
  value = module.public_subnets
}

output "test" {
  value = lookup(lookup(module.public_subnets, "public", null), "subnets", null)[0].id
}

output "all_route_tables" {
  value = local.all_route_tables
}

#output "app_subnets" {
#  value = [ for
#}
##output "subnets" {
##  value = module.subnets
##}
#
#output "public_subnets" {
#  value = module.public_subnets
#}
#
#output "private_subnets" {
#  value = module.private_subnets
#}
#
##output "all_private_subnets" {
##  value = [for k,v in module.private_subnets: v.subnets]
##}