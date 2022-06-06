#!/bin/bash

sudo yum update -y
sudo yum install docker -y

sudo systemctl enable docker
sudo systemctl start docker

sudo hostnamectl set-hostname ${NAME}
