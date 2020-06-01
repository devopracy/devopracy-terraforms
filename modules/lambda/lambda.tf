// LAMBDA
resource "aws_lambda_function" "service-lambda" {
  function_name = "${var.service-name}-lambda"

  # The bucket is created in a different workspace for our lambdas.
  # It makes for better operational coupling if you can put up and tear
  # down the service without affecting the storage. Using -target is an
  # antipattern.
  s3_bucket = var.artifact-bucket-name
  handler = var.bin-name
  runtime = "go1.x"
  role = aws_iam_role.service-role.arn
}

