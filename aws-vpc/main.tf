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

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "private" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc.id
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "public" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.my-vpc.id # interpolated value
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "my-rt" {
  tags = {
    Name = "my-route table"
  }
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
}

resource "aws_route_table_association" "pub-subnet" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_instance" "my-pub-server" {
  ami                         = "ami-042b4708b1d05f512"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  tags = {
    Name = "MyPublicServer"
  }
}

