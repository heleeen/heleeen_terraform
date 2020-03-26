resource "aws_lambda_function" "this" {
  function_name    = var.name
  handler          = format("%s.%s", var.name, "exec")
  role             = aws_iam_role.lambda.arn
  runtime          = "ruby2.5"
  filename         = data.archive_file.function.output_path
  source_code_hash = data.archive_file.function.output_base64sha256

  dynamic "environment" {
    for_each = var.environments

    content {
      variables = var.environments
    }
  }
}

data "archive_file" "function" {
  type        = "zip"
  source_dir  = "function"
  output_path = "script.zip"
}

# TODO log group
