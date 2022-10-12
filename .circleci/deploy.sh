#!/bin/sh

echo "logging in"
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 764941139426.dkr.ecr.ap-south-1.amazonaws.com
echo "Pulling a image"
docker pull 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest
echo "Pull complete"

if [ "$( docker container inspect -f '{{.State.Status}}' 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest )" == "running" ];

then
docker stop 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest
docker rm 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest

fi


# docker stop $AWS_ECR_ACCOUNT_URL/temp
# docker rm $AWS_ECR_ACCOUNT_URL/temp
docker run -p 80:3000 -d 764941139426.dkr.ecr.ap-south-1.amazonaws.com/temp:latest