#!/bin/bash
sudo apt update -y
sudo apt install npm -y 
git init
git clone https://github.com/javed97/resume-generator.git
cd /home/ubuntu/resume-generator
sudo npm -g install create-react-app
sudo rm -rf node_modules
sudo rm -rf package-lock.json
sudo npm install
sleep 20
sudo npm start
