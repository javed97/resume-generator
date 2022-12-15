#!/bin/bash
cd /home/ubuntu/
sudo apt update -y
sudo apt install npm -y
git init
git clone -b dev https://github.com/javed97/resume-generator.git
cd /home/ubuntu/resume-generator
sudo /usr/bin/npm -g install create-react-app
sudo rm -rf node_modules
sudo rm -rf package-lock.json
sudo npm install -g
sleep 20
npm start

