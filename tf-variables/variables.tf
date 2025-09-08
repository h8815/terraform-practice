variable "aws_instance" {
  description = "Enter the AWS instance type"
  type        = string
  validation {
    condition     = var.aws_instance == "t3.micro" || var.aws_instance == "t2.micro"
    error_message = "The instance type must be either t3.micro or t2.micro."
  }
}

variable "root_block_config" {
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}
