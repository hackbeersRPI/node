#!/bin/bash

sudo apt-get -q update
sudo apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libical-dev libreadline-dev libudev-dev libusb-dev make

git clone https://github.com/todbot/blink1.git
cd blink1/commandline
make
sudo make install

read -d '' rules <<EOF
# Copy this udev with 'sudo cp 51-blink1.rules /etc/udev/rules.d/''
# Edit it to suit your type of Linux. It's currently set up for modern Ubuntu
# When done, do 'sudo udevadm control --reload-rules'
# and unplug and replug in the blink1 device.

# Note the hex values for vid & pid must be lower-case
# SYSFS{idVendor}=='27b8', SYSFS{idProduct}=='01ed', MODE='666'
#ATTRS{idVendor}=='27b8', ATTRS{idProduct}=='01ed', SUBSYSTEMS=='usb', ACTION=='add', MODE='0666', GROUP='plugdev'

# modern ubuntu
SUBSYSTEM=='input', GROUP='input', MODE='0666'
SUBSYSTEM=='usb', ATTRS{idVendor}=='27b8', ATTRS{idProduct}=='01ed', MODE:='666', GROUP='plugdev'
EOF

sudo echo "$rules" > /etc/udev/rules.d/51-blink1.rules

sudo udevadm control --reload-rules

sudo npm install node-red-node-blink1 -g --unsafe-perm
