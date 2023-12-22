#!/bin/bash

ENV=$1
ENDPOINT=$2

AWS_REGION="eu-west-3"
AWS_ACCESS_KEY_ID="your_access_key_id"
AWS_SECRET_ACCESS_KEY="your_secret_access_key"
sudo pacman -S aws-cli jq
API_URL_SSM=$(aws ssm get-parameter --name "/poja-big-sum-std22099/$ENV/api/url" --region "$AWS_REGION" --output json)

API_URL=$(echo "$API_URL_SSM" | jq -r '.Parameter.Value')
curl --fail "$API_URL$ENDPOINT"
