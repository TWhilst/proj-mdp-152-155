#!/bin/bash
# Install Git and Docker
sudo yum -y install git docker
# Start and Enable Docker
sudo systemctl start docker
sudo systemctl enable docker
# Gives ec2-user and jenkins access to Docker
sudo usermod -a -G docker ec2-user
# run the Tomcat image
docker container run --name javaweb -p 8080:8080 -dt tomcat