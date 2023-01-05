#!/bin/bash

sudo echo $(hostname) > /usr/share/nginx/html/index.html
sudo systemctl start nginx
