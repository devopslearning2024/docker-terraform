#! /bin/bash
sudo yum  -y update
sudo yum install -y java
sudo yum install -y docker
sudo service docker start
sudo service docker status
sudo docker pull nginx:latest
sudo docker run -itd --name nginx-web -p 80:80 nginx:latest