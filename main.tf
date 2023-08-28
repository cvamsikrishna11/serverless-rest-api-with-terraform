
# to store the datasets in s3
module "s3_data_source" {
  source = "./s3"
  project_name = local.project_name
  bucket_name = "datasource-movies"
  common_tags = local.tags
}

# to create permissions
module "iam" {
  source = "./iam"
  project_name = local.project_name
  iam_role_name = "lambda-permissions-role" 
  common_tags = local.tags
}

# to create Lambda function to get the call
module "lambda"{
  source = "./lambda"
  project_name = local.project_name
  function_name = "s3-get"
  lambda_role_arn = module.iam.iam_role_arn
  bucket_name = module.s3_data_source.bucket_name
  object_name = "movies.json"
  common_tags = local.tags
}

# API module
module "api"{
  source = "./api-gateway"
  project_name = local.project_name
  api_name = "api"
  lambda_function_arn = module.lambda.lambda_function_arn
  lambda_function_name = module.lambda.lambda_function_name  
  region = local.region
  common_tags = local.tags
}