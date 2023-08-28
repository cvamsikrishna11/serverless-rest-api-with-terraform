output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_data_source.bucket_name
}


output "iam_role_arn" {
  description = "The ARN of IAM role"  
  value = module.iam.iam_role_arn
}


output "lambda_function_name" {
  description = "The name of the Lambda function"  
  value = module.lambda.lambda_function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"  
  value = module.lambda.lambda_function_arn
}


output "api_endpoint_url" {
  description = "The URL endpoint for the API GET method"
  value       = module.api.api_endpoint_url
}
