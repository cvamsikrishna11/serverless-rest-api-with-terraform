variable "project_name" {
  description = "Project name" 
}

variable "bucket_name" {
  description = "The name of the bucket to be created." 
}

variable "common_tags" {
  description = "Common tags across the application"
  type        = map(string)
}