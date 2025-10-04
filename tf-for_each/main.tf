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
  for_each      = var.ec2_map # we will get each.key and each.value
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = element(aws_subnet.main[*].id, index(keys(var.ec2_map), each.key) % length(aws_subnet.main))
  tags = {
    Name = "${local.value}-${each.key}"
  }
}
