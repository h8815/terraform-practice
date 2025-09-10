terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mydemoserver" {
  ami           = "ami-042b4708b1d05f512"
  instance_type = "t3.micro"
  tags = {
    Name = "MyDemoServer"
  }
}
