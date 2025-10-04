data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
}

data "aws_caller_identity" "name" {}