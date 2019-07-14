variable region {
  default = "eu-central-1"
}

resource aws_iam_user kumite_user {
  name = "kumite-recorder"
  path = "/"

  tags = {
    Application = "kumite-recorder"
  }
}

resource aws_iam_user_policy_attachment kumite_IAM_policy {
  user       = aws_iam_user.kumite_user.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource aws_iam_user_policy_attachment kumite_S3_policy {
  user       = aws_iam_user.kumite_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource aws_iam_user_policy_attachment kumite_dynamo_policy {
  user       = aws_iam_user.kumite_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource aws_s3_bucket kumite_recorder {
  bucket = "kumite-recorder"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Application = "kumite-recorder"
  }
}

module modules {
  source = "./modules"
  region = var.region
}