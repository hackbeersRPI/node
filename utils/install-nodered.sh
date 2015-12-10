#!/bin/bash

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y build-essential python-dev python-rpi.gpio nodejs

# Installing nodered
sudo npm cache clean
sudo npm install -g --unsafe-perm  node-red

sudo npm node-red-contrib-advanced-ping -g --unsafe-perm
sudo npm node-red-contrib-ds18b20-sensor -g --unsafe-perm
sudo npm node-red-contrib-eddystone -g --unsafe-perm
sudo npm node-red-node-physical-web -g --unsafe-perm
sudo npm node-red-node-sqlite -g --unsafe-perm
