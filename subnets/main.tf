module "lm-subnets"{
  for_each = var.subnets
  cidr_block = each.value.cidr_block
  sourc = "./lm-subnets"
  vpc_id=var.vpc_id
}