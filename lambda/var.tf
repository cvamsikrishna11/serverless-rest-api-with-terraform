variable "project_name" {
  description = "Project name" 
}

variable "function_name" {
  description = "Lambda function name" 
}

variable "bucket_name" {
  description = "Bucket name to read from" 
}

variable "object_name" {
  description = "Object name to read from" 
}

variable "lambda_role_arn" {
  description = "Lambda role ARN with CloudWatch and S3 access" 
}

variable "common_tags" {
  description = "Common tags across the application"
  type        = map(string)
}