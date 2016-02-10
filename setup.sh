#!/bin/bash
#install dependencies
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install git nodejs npm supervisor nginx
sudo ln -s /usr/bin/nodejs /usr/local/bin/node
#copy config files into place
sudo rsync -av elevation-service-deploy/etc/ /etc/

#install elevation service
git clone https://github.com/JesseCrocker/elevation-service.git
cd elevation-service
npm install

#launch services
sudo /etc/init.d/nginx restart
sudo supervisorctl reload

#test it
curl -v http://localhost/status/
