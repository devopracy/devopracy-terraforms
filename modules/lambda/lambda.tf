// LAMBDA
resource "aws_lambda_function" "example" {
  function_name = var.bin-name

  # The bucket is created in a different workspace for our lambdas.
  # It makes for better operational coupling if you can put up and tear
  # down the service without affecting the storage. Using -target is an
  # antipattern.
  s3_bucket = var.artifact-bucket-name

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "main.handler"
  runtime = "nodejs10.x"

  role = aws_iam_role.service-role.arn
}

