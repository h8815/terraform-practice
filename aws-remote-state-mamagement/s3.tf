resource "aws_s3_bucket" "remote-bucket" {
  bucket = "demo-remote-s3-aws-bucket"
  tags = {
    Name = "Remote State Bucket"
  }
}
