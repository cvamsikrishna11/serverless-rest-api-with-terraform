import json
import boto3
import os


def lambda_handler(event, context):
    s3 = boto3.client('s3')
    
    # Specify the bucket name and JSON file name
    bucket_name = os.environ.get('BUCKET_NAME')
    file_name = os.environ.get('OBJECT_NAME')
    

    # Fetch the JSON data
    print("Request from API Gateway, queying the bucket: {}, object: {}".format(bucket_name, file_name))
    response = s3.get_object(Bucket=bucket_name, Key=file_name)
    file_content = response['Body'].read().decode('utf-8')
    data = json.loads(file_content)
    print("The data returned from S3: ", data)    
    result = {
        'statusCode': 200,
        'body': json.dumps(data)
    }
    print("Response Object: {}".format(result))
    return result
