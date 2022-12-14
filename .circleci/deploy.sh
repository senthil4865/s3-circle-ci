#!/bin/sh

echo "logging in"
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 764941139426.dkr.ecr.ap-south-1.amazonaws.com
echo "Pulling a image"
docker pull 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest
echo "Pull complete"

CONTAINER_NAME='sales-frontend'
CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)
EXIT=$(docker ps -q -f status=exited -f name=^/${CONTAINER_NAME}$)
if [ "${CID}" ]; then
  echo "Container exists"
  docker stop sales-frontend
  docker rm sales-frontend
fi

if [ "${EXIT}" ]; then
  echo "Container exists"
  docker rm sales-frontend
fi

# docker stop $AWS_ECR_ACCOUNT_URL/temp
# docker rm $AWS_ECR_ACCOUNT_URL/temp
docker run --name sales-frontend -p 3000:3000 -d 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest