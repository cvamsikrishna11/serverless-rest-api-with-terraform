output "api_endpoint_url" {
  description = "The URL endpoint for the API GET method"
  value       = "https://${aws_api_gateway_rest_api.json_api.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.json_api_deployment.stage_name}/${aws_api_gateway_resource.api_resource.path_part}/${aws_api_gateway_resource.json_resource.path_part}"
}
