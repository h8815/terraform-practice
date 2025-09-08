terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "mydemoserver" {
  ami           = "ami-042b4708b1d05f512"
  instance_type = var.aws_instance
  root_block_device {
    delete_on_termination = true
    volume_size           = var.root_block_config.v_size
    volume_type           = var.root_block_config.v_type
  }
  tags = {
    Name = "MyDemoServer"
  }
}
