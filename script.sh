#!/bin/bash
sudo yum install java-21 -y
sudo yum -y install git docker
# Start and Enable Docker
sudo systemctl start docker
sudo systemctl enable docker
# Gives ec2-user and jenkins access to Jenkins
sudo usermod -a -G docker jenkins
sudo usermod -a -G docker ec2-user
# install ansible
sudo yum install ansible -y