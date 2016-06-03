#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install bison flex libusb-dev
cd /tmp
wget http://download.savannah.gnu.org/releases/avrdude/avrdude-6.1.tar.gz
tar xf avrdude-6.1.tar.gz
cd avrdude-6.1
./configure --prefix=/opt/avrdude --enable-linuxgpio
make
sudo make install
cp /etc/avrdude.conf ~/avrdude_gpio.conf

#installing the gcc compiler
sudo apt-get install gcc-avr binutils-avr avr-libc

#for in-system debugging/emulation.
sudo apt-get install gdb-avr
