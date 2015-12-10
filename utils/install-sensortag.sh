#!/bin/bash

sudo apt-get -q update
sudo apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libical-dev libreadline-dev libudev-dev libusb-dev make

wget https://www.kernel.org/pub/linux/bluetooth/bluez-5.32.tar.xzwget https://www.kernel.org/pub/linux/bluetooth/bluez-5.32.tar.xz
tar xvf bluez-5.32.tar.xz
cd bluez-5.32

./configure --disable-systemd
make
sudo make install

sudo npm install node-red-node-sensortag -g --unsafe-perm
