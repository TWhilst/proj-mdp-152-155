#!/bin/bash
sudo dnf install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade
# Add required dependencies for the jenkins package
sudo dnf install fontconfig java-21 -y
sudo dnf install jenkins -y
sudo systemctl daemon-reload
# Start and Enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Install Git and Docker
sudo yum -y install git docker
# Start and Enable Docker
sudo systemctl start docker
sudo systemctl enable docker
# Gives ec2-user and jenkins access to Jenkins
sudo usermod -a -G docker jenkins
sudo usermod -a -G docker ec2-user