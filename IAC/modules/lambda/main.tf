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
  name        = "kumite_writer_lambda_role"
  path        = "/"

  assume_role_policy ="${data.aws_iam_policy_document.lambda_assume_role_policy.json}"
}

data archive_file lambda_payload {
  type        = "zip"
  source_file = "${path.cwd}/${path.module}/payload.py"
  output_path = "${path.cwd}/${path.module}/payload.zip"
}

resource aws_lambda_function kumite_writer {
  filename = data.archive_file.lambda_payload.output_path
  function_name = "kumite-writer"
  role = aws_iam_role.kumite_writer_lambda_role.arn
  handler = "payload.handler"

  source_code_hash = data.archive_file.lambda_payload.output_base64sha256

  runtime = "python3.7"

  tags = {
    Application = "kumite-recorder"
  }
}