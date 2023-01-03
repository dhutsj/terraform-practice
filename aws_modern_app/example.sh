#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo echo $(hostname) > /usr/share/nginx/html/index.html
