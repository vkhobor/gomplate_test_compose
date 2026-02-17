#!/bin/bash

# AWS Authentication Setup - Choose one method:
# https://docs.gomplate.ca/datasources/#using-awssm-datasources
# https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html

# Method 1: Environment Variables
export AWS_ACCESS_KEY_ID='your-access-key-id'
export AWS_SECRET_ACCESS_KEY='your-secret-access-key'
export AWS_REGION='us-east-1'

# Method 2: Use AWS CLI profile (alternative)
# export AWS_PROFILE='your-profile-name'

# Method 3: IAM role (if running on EC2/ECS/Lambda)
# No environment variables needed

# Create AWS Secrets Manager secret first:
# aws secretsmanager create-secret --name "app-config" --secret-string '{"password":"aws-password","api_key":"aws-api-key","app_env":"production"}'

gomplate \
  -d aws=aws+sm:///app-config?region=us-east-1 \
  -d config=./datasources/config.json \
  -f ./template/docker-compose.template.yml \
  -o docker-compose-aws.out.yml
