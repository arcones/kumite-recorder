output lambda_invoke_arn {
  value = aws_lambda_function.kumite_writer.invoke_arn
}

output lambda_arn {
  value = aws_lambda_function.kumite_writer.arn
}

output lambda_function_name {
  value = aws_lambda_function.kumite_writer.function_name
}