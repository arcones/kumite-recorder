resource aws_dynamodb_table kumite_records {
  name         = "Exchange"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"
  range_key    = "Timestamp"

  attribute {
    name = "Id"
    type = "N"
  }
  //
  //  attribute {
  //    name = "RequestOrResponse"
  //    type = "B"
  //  }

  attribute {
    name = "Timestamp"
    type = "N"
  }

  tags = {
    Application = "kumite-recorder"
  }
}