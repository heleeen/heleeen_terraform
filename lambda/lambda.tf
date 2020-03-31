resource "aws_lambda_function" "this" {
  function_name    = var.name
  handler          = format("%s.%s", var.name, "exec")
  role             = aws_iam_role.lambda.arn
  runtime          = "ruby2.5"
  timeout = var.timeout
  filename         = data.archive_file.function.output_path
  source_code_hash = data.archive_file.function.output_base64sha256

  environment {
    variables = var.environments
  }
}

data "archive_file" "function" {
  type        = "zip"
  source_dir  = "function"
  output_path = "script.zip"
}

# TODO log group
