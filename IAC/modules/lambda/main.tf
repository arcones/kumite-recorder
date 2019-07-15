data aws_iam_policy_document lambda_assume_role_policy {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource aws_iam_role kumite_writer_lambda_role {
  name               = "kumite_writer_lambda_role"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_assume_role_policy.json}"
  tags = {
    Application = "kumite-recorder"
  }
}

variable "iam_policy_arn" {
  type    = "list"
  default = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
}

resource aws_iam_role_policy_attachment kumite_writer_lambda_policy {
  role       = aws_iam_role.kumite_writer_lambda_role.name
  count      = length(var.iam_policy_arn)
  policy_arn = var.iam_policy_arn[count.index]
}

data archive_file lambda_payload {
  type        = "zip"
  source_file = "${path.cwd}/${path.module}/payload.py"
  output_path = "${path.cwd}/${path.module}/payload.zip"
}

resource aws_lambda_function kumite_writer {
  filename      = data.archive_file.lambda_payload.output_path
  function_name = "kumite-writer"
  role          = aws_iam_role.kumite_writer_lambda_role.arn
  handler       = "payload.handler"

  source_code_hash = data.archive_file.lambda_payload.output_base64sha256

  runtime = "python3.7"

  tags = {
    Application = "kumite-recorder"
  }
}