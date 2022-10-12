#!/bin/sh

echo "Pulling a image"
docker pull $AWS_ECR_ACCOUNT_URL/temp
echo "Pull complete"
# docker stop $AWS_ECR_ACCOUNT_URL/temp
# docker rm $AWS_ECR_ACCOUNT_URL/temp
docker run -p 80:3000 -d $AWS_ECR_ACCOUNT_URL/temp