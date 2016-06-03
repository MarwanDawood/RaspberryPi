#!/bin/bash

#get all the passed arguments in this array
#args=("$@")

#check on the number of passed arguments
#to select an array element, type ${args[x]}
#if [ "$#" = 3 ]; then

read -p "update the linux distro (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
apt-get upgrade
apt-get update
fi


#a declared variable for indicating first time to install lirc
#INSTALL_LIRC_FIRST_TIME=true

read -p "install lirc (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
#1. install this package
apt-get install lirc liblircclient-dev
fi


read -p "configure the input/output pins (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
#2. to start the modules up on boot
echo "lirc_dev" >>/etc/modules

#3. pin 18 will be used to take the output from the IR sensor
echo "lirc_rpi gpio_in_pin=18 gpio_out_pin=22" >>/etc/modules
fi

#4. Edit /etc/lirc/hardware.conf and have it appear exactly as shown below.
rm /etc/lirc/hardware.conf
echo "########################################################
# /etc/lirc/hardware.conf

# Arguments which will be used when launching lircd
LIRCD_ARGS="--uinput"

# Don't start lircmd even if there seems to be a good config file
# START_LIRCMD=false

# Don't start irexec, even if a good config file seems to exist.
# START_IREXEC=false

# Try to load appropriate kernel modules
LOAD_MODULES=true

# Run "lircd --driver=help" for a list of supported drivers.
DRIVER="default"

# usually /dev/lirc0 is the correct setting for systems using udev
DEVICE="/dev/lirc0"
MODULES="lirc_rpi"

# Default configuration files for your hardware if any
LIRCD_CONF=""
LIRCMD_CONF=""
########################################################" >>/etc/lirc/hardware.conf


read -p "update /boot/config.txt file (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
#5. add in /boot/config.txt the following line
echo "dtoverlay=lirc-rpi" >>/boot/config.txt
fi

#6. stopping the service
/etc/init.d/lirc stop

#7. mode2 to get device info
mode2 -d /dev/lirc0

#8. restart lirc service
/etc/init.d/lirc restart

fi #for installing the package
#fi #for checking number of passed arguments

echo "end of configuration.."
