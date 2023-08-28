variable "project_name" {
  description = "Project name" 
}

variable "api_name" {
  description = "API Gateway Endpoint name"
  type        = string  
}

variable "lambda_function_name" {
  description = "Lambda function name" 
}

variable "lambda_function_arn" {
  description = "Lambda function arn" 
}

variable "region" {
  description = "Deployment Region" 
}

variable "common_tags" {
  description = "Common tags across the application"
  type        = map(string)
}