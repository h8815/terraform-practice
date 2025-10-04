
variable "vpc_config" {
  description = "To get the CIDR and NAme of the VPC from User"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format - ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  #   Sub1 = {cidr = ... , az = ..} sub2 = {} sub3 = {}.... [N numbers of subnets]
  description = "Getting the availability zone and cidr_block for the subnet"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false) # private by default user can make it public
  }))
  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid Subnet CIDR format"
  }
}
