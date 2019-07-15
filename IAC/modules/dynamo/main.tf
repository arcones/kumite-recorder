resource aws_dynamodb_table kumite_records {
  name         = "Exchange"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
  tags = {
    Application = "kumite-recorder"
  }
}