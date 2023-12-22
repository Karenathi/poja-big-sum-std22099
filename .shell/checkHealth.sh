#!/bin/bash

ENV=$1
ENDPOINT=$2

AWS_REGION="eu-west-3"
AWS_ACCESS_KEY_ID="AKIA2YY5SSOHB5Y6KT6L"
AWS_SECRET_ACCESS_KEY="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"
sudo pacman -S aws-cli jq
API_URL_SSM=$(aws ssm get-parameter --name "/poja-big-sum-std22099/$ENV/api/url" --region "$AWS_REGION" --output json)

API_URL=$(echo "$API_URL_SSM" | jq -r '.Parameter.Value')
curl --fail "$API_URL$ENDPOINT"
