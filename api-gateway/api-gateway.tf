resource "aws_api_gateway_rest_api" "json_api" {
  name        = "${var.project_name}-${terraform.workspace}-${var.api_name}"
  description = "API to fetch JSON data from S3"

  tags = merge({ Environment = "${terraform.workspace}" }, var.common_tags)
}


resource "aws_api_gateway_resource" "api_resource" {
  rest_api_id = aws_api_gateway_rest_api.json_api.id
  parent_id   = aws_api_gateway_rest_api.json_api.root_resource_id
  path_part   = "api"
}


resource "aws_api_gateway_resource" "json_resource" {
  rest_api_id = aws_api_gateway_rest_api.json_api.id
  parent_id   = aws_api_gateway_resource.api_resource.id
  path_part   = "foo"
  
}


resource "aws_api_gateway_method" "json_method" {
  rest_api_id   = aws_api_gateway_rest_api.json_api.id
  resource_id   = aws_api_gateway_resource.json_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "json_integration" {
  rest_api_id             = aws_api_gateway_rest_api.json_api.id
  resource_id             = aws_api_gateway_resource.json_resource.id
  http_method             = aws_api_gateway_method.json_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_function_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.json_api.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "json_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.json_api.id
  stage_name  = "prod"

  triggers = {
    redeployment = sha256(jsonencode(aws_api_gateway_rest_api.json_api.body))
  }

  depends_on = [
    aws_api_gateway_integration.json_integration
  ]
}
