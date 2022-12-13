#!/bin/bash
cd /home/ubuntu/
sudo apt update -y
git init
git clone -b dev https://github.com/javed97/resume-generator.git
rm -rf node_modules
sudo apt install npm -y
cd /home/ubuntu/resume-generator
sudo /usr/bin/npm -g install create-react-app
rm -rf node_modules
sudo /usr/bin/npm install -y
sudo /usr/bin/npm run build
sleep 10
sudo npm start 
