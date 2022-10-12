#!/bin/sh

echo "logging in"
docker login -u AWS -p $(aws ecr get-login-password --region ap-south-1) ec2-3-108-66-178.ap-south-1.compute.amazonaws.com
echo "Pulling a image"
docker pull ec2-3-108-66-178.ap-south-1.compute.amazonaws.com/temp
echo "Pull complete"
# docker stop $AWS_ECR_ACCOUNT_URL/temp
# docker rm $AWS_ECR_ACCOUNT_URL/temp
docker run -p 80:3000 -d ec2-3-108-66-178.ap-south-1.compute.amazonaws.com/temp