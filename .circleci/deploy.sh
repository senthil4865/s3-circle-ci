#!/bin/sh

docker pull $AWS_ECR_ACCOUNT_URL/temp
# docker stop $AWS_ECR_ACCOUNT_URL/temp
# docker rm $AWS_ECR_ACCOUNT_URL/temp
docker run -p 80:3000 -d $AWS_ECR_ACCOUNT_URL/temp