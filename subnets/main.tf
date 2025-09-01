resource "aws_subnet" "main" {
  count = length(var.cidr_block)
  vpc_id = var.vpc_id
  cidr_block = element(var.cidr_block, count.index)
  tags = local.subnet_tags
  availability_zone = element(var.subnet_availability_zones, count.index)
}
resource "aws_route_table" "aws_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name    = "${var.env}-${var.name}-rt"
    ENV     = var.env
    PROJECT = "roboshop"
  }
}
resource "aws_route_table_association" "route_table_association" {
  count          = length(aws_subnet.main)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.aws_route_table.id
}

resource "aws_route" "internet_gateway_route" {
  route_table_id            = aws_route_table.aws_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = var.gateway_id
}


#output "subnets" {
#  value = aws_subnet.main
#}


#module "lm-subnets" {
#  for_each = var.subnets
#  cidr_block = each.value.cidr_block
#  source = "./lm-subnets"
#  vpc_id = var.vpc_id[0]
#  env = var.env
#  name = each.value.name
#  subnet_availability_zones = var.subnet_availability_zones
#  route_table_id = lookup(lookup(aws_route_table.aws_route_table,each.value.name, null ), "id", null)
#}

#resource "aws_route_table" "aws_route_table" {
#  for_each = var.subnets
#  vpc_id = var.vpc_id[0]
#  tags = {
#    Name    = "${var.env}-${each.value.name}-rt"
#    ENV     = var.env
#    PROJECT = "roboshop"
#  }
#}
##Here we are adding route for peering connection
#resource "aws_route" "peering_connection_route" {
#  for_each = var.subnets
#  route_table_id         = lookup(lookup(aws_route_table.aws_route_table,each.value.name, null ), "id", null)
#  destination_cidr_block = lookup(var.management_vpc, "vpc_cidr", null )
#  vpc_peering_connection_id = var.peering_connection_id
#}
#resource "aws_route" "gateway_connection_route" {
#  for_each                  = var.subnets
#  route_table_id            = lookup(lookup(aws_route_table.route_table, each.value.name, null ), "id", null)
#  destination_cidr_block    = lookup(var.management_vpc, "vpc_cidr", null )
#  vpc_peering_connection_id = var.peering_connection_id
#}

#output "route_tables" {
#  value = aws_route_table.aws_route_table
#}

#output "subnets" {
#  value = flatten([for i,j in module.lm-subnets: j.subnets])
#}

