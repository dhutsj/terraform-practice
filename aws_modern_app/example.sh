#!/bin/bash

sudo yum update -y
# sudo yum install nginx -y
# sudo systemctl start nginx
# sudo echo $(hostname) > /usr/share/nginx/html/index.html
sudo yum install docker -y
sudo systemctl start docker
docker pull dhutsj/python_demo:v1
docker run -itd --name python_demo dhutsj/python_demo:v1
