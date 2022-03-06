#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install bison flex libusb-dev
wget http://download.savannah.gnu.org/releases/avrdude/avrdude-6.1.tar.gz -P /tmp
tar xf avrdude-6.1.tar.gz
pushd /tmp/avrdude-6.1
./configure --prefix=/opt/avrdude --enable-linuxgpio
make
sudo make install
popd
cp /tmp/avrdude-6.1/avrdude.conf avrdude_gpio.conf

#installing the gcc compiler for AVR uC
sudo apt-get install gcc-avr binutils-avr avr-libc

#for in-system debugging/emulation.
sudo apt-get install gdb-avr
