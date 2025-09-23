resource "aws_dynamodb_table" "name" {
  name         = "demo-remote-state-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "demo-remote-state-table"
  }
}
