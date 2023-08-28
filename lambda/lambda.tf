resource "aws_lambda_function" "json_fetcher" {
  function_name    = "${var.project_name}-${terraform.workspace}-${var.function_name}"
  filename         = "get-s3-content.zip"
  source_code_hash = filebase64sha256("get-s3-content.zip")
  handler          = "get-s3-content.lambda_handler"
  runtime          = "python3.8"
  role             = var.lambda_role_arn

  
  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
      OBJECT_NAME = var.object_name
    }
  }

  tags = merge({ Environment = "${terraform.workspace}" }, var.common_tags)
}