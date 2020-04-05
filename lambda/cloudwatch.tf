resource "aws_cloudwatch_log_group" "this" {
  name = format("%s%s", "/aws/lambda/", var.name)

  retention_in_days = 7
}
