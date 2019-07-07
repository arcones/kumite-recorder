terraform {
  backend s3 {
    bucket = "kumite-state"
    region = "eu-central-1"
    key = "kumite-recorder/global/s3/terraform.tfstate"
    encrypt = true
  }
}

provider aws {
  region = "eu-central-1"
  //TODO pending to use specific profile
}

resource aws_iam_user kumite_user {
  name = "kumite"
  path = "/"

  tags = {
    Application = "kumite-recorder"
  }
}

data aws_iam_policy IAM_full_access {
  arn =  "arn:aws:iam::aws:policy/IAMFullAccess"
}

data aws_iam_policy dynamo_full_access {
  arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data aws_iam_policy S3_full_access {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource aws_iam_user_policy_attachment kumite_IAM_policy {
  user = aws_iam_user.kumite_user.name
  policy_arn = data.aws_iam_policy.IAM_full_access.arn
}

resource aws_iam_user_policy_attachment kumite_S3_policy {
  user = aws_iam_user.kumite_user.name
  policy_arn = data.aws_iam_policy.S3_full_access.arn
}

resource aws_iam_user_policy_attachment kumite_dynamo_policy {
  user = aws_iam_user.kumite_user.name
  policy_arn = data.aws_iam_policy.dynamo_full_access.arn
}

resource aws_s3_bucket kumite_state {
  bucket = "kumite-state"
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