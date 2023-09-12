resource "aws_dynamodb_table" "devopslabs01-tfstate-lock" {
  name           = "devopslabs01-tfstate-lock"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
  Name = "devopslabs01"
  }
}