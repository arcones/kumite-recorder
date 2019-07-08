resource aws_lambda_function kumite_writer {
  filename = "payload.py"
  function_name = "kumite-writer"
  role = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  handler = "exports.test"

  source_code_hash = filebase64sha256("${path.cwd}/${path.module}/payload.py")

  runtime = "python3.7"

  tags = {
    Application = "kumite-recorder"
  }
}