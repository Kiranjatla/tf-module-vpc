

variable "abc" {
  default = {
    "one" = {
      x = 100
    }
    "one" = {
      x = 120
    }
  }
}
variable "xyz" {
  default = {
    "one" = {
      y = 200
    }
    "one" = {
      y = 220
    }
  }
}

locals {
  local = {
    one = {
      x = 100
    }
    two = {
      x = 100
    }
  }
  subnet_feature1 = {
    one = {
      y = 200
    }
    two = {
      y = 220
    }
  }
}


output "calc_map" {
  value = {
       for i in keys(var.xyz) : i => {
           x = var.abc[i].x
           y = var.xyz[i].y
  }
  }
}


























##variable "demo"{
##  default = [
##    {
##      "id" = "xyz"
##    },
##    {
##      "id" = "abc"
##    }
##  ]
##}
##
##output "demo" {
##  value = var.demo[*].id
##}
#
#variable "demo"{
#  default = [
#    {
#      "id" = "xyz"
#    },
#    {
#      "id" = "abc"
#    }
#  ]
#}
#
#output "demo" {
#  value = var.demo[*].id
#}