terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "random_id" "rand_id" {
  byte_length = 5
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-demo-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket_object" {
  bucket = aws_s3_bucket.demo_bucket.bucket
  source = "./demo.txt"
  key    = "mydata.txt"
}


output "rand_output" {
  value = random_id.rand_id.hex
}
