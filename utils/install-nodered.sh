#!/bin/bash

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y build-essential python-dev python-rpi.gpio nodejs

# Installing nodered
sudo npm cache clean
sudo npm install -g --unsafe-perm  node-red
