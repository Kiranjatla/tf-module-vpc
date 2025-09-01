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