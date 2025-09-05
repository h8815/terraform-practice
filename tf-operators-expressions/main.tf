terraform {}

# number list
variable "number_list" {
  type    = list(number)
  default = [1, 2, 3, 5, 6, 48]
}

# object list of person
variable "person_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [{
    fname = "Himanshu"
    lname = "Solanki"
    }, {
    fname = "Ancal"
    lname = "solanki"
  }]
}

# map (like python's dictionary { key - value } pair)
variable "map_list" {
  type = map(number)
  default = {
    "zero"  = 0
    "one"   = 1
    "two"   = 2
    "three" = 3
  }
}

locals {

  # calculations
  multiply = 2 * 5
  addition = 2 + 5

  # using for loop (doubling value of number_list)
  double_value = [for val in var.number_list : val * 2]

  # if in loop
  odd_number = [for val in var.number_list : val if val % 2 != 0]

  # geetting only the fname form person_list
  fname_list = [for name in var.person_list : name.fname]

  # using range in for loop
  table = [for i in range(1, 11) : "5 x ${i} = ${5 * i}"]

  # working with map
  using_map = [for key, value in var.map_list : value * 5] # multiply value by 5

  #modify value in map (making secondary map)
  double_of_map_value = { for key, value in var.map_list : key => value * 2 }
}

output "Outputs" {
  value = local.table
}
