# AWS Serverless REST API POC

Repo to create the infra & app code for the Serverless REST API that can read S3 file content and return the json. 

This repository contains a Terraform configuration for deploying AWS resources. 

The Terraform configuration creates S3, IAM roles, Lambda and API Gateway related resources.

The infrastructure is created in the `us-west-1` AWS region.

## Prerequisites

- Terraform (latest)
- AWS Account
- AWS CLI

## Getting Started

1. Clone the repository:

    ```shell
    git clone https://github.com/cvamsikrishna11/serverless-rest-api-with-terraform.git
    cd serverless-rest-api-with-terraform
    ```

2. Zip the file get-s3-content.py with the name get-s3-content.zip

3. Initialize Terraform:

    ```shell
    terraform init
    ```

4. Create a plan and apply:

    ```shell
    terraform plan
    terraform apply --auto-approve
    ```

## Once the infra is created access the API gateway that will be displayed as the output with value api_endpoint_url

## Result: On successful deploy the API call should return the movies.json content as response

## Destroying Infrastructure

When you're done with the infrastructure, you can destroy it using below commands:

1. Delete the content in the S3 bucket
2. ```shell
    terraform destroy --auto-approve
   ```
