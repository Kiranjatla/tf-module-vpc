resource "aws_internet_gateway" "gw" {
  count = length(local.vpc_ids)
  vpc_id = element(local.vpc_ids, count.index)
  tags = {
    Name = "${var.env}-igw"
  }
}
resource "aws_nat_gateway" "lb" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = "aws_eip.nge.id"
  subnet_id = "aws_subnet.ngw.id"
  tags = {
    Name = "${var.env}-ngw"
  }
}