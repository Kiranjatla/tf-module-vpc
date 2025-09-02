locals{
  vpc_tags={
    Name    = "${var.env}-vpc"
    ENV     = var.env
    Project = "roboshop"
  }
  vpc_peering_tags = {
    Name    = "${var.env}-vpc-to-management-vpc"
    ENV     = var.env
    PROJECT = "roboshop"
  }
  all_route_tables = concat([for i, j in module.private_subnets : j.route_tables.id], [for i, j in module.public_subnets : j.route_tables.id])
#  vpc_ids = [for k, v in aws_vpc.main : v.id]
}

