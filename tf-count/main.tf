terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

locals {
  value = "test"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.value}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my-vpc.id
  count      = 2
  cidr_block = "10.0.${count.index}.0/24"
  tags = {
    Name = "subnet-${count.index}"
  }
}

resource "aws_instance" "main" {
  count         = length(var.ec2_config)
  ami           = var.ec2_config[count.index].ami
  instance_type = var.ec2_config[count.index].instance_type
  subnet_id     = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))

  tags = {
    Name = "${local.value}-instance-${count.index}"
  }
}
