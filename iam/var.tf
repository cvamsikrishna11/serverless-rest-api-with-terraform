variable "project_name" {
  description = "Project name" 
}

variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string  
}

variable "common_tags" {
  description = "Common tags across the application"
  type        = map(string)
}