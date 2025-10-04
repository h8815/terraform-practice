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

resource "aws_instance" "mydemoserver" {
  ami           = data.aws_ami.name.id
  instance_type = "t3.micro"

  tags = {
    Name = "MyDemoServer"
  }
}
