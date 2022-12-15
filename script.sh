#!/bin/bash
cd /home/ubuntu/
sudo apt update -y
sudo apt install npm -y
git init
git clone -b dev https://github.com/javed97/resume-generator.git
cd /home/ubuntu/resume-generator
sudo /usr/bin/npm -g install create-react-app
sudo npm install -y
sudo npm run build
sudo apt install nginx -y
sudo chmod -R 777 /home/ubuntu/resume-generator/
cp -R /home/ubuntu/resume-generator/  /var/www/html/
mv /home/ubuntu/resume-generator/default  /etc/nginx/sites-available/
sudo systemctl restart nginx 

