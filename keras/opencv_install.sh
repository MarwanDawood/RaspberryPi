#!/bin/sh

read -p "install using apt-get, try this at first time please (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
apt-get update
apt-get upgrade
sudo apt-get install python-opencv libopencv-dev python-numpy python-dev
fi

read -p "if the previous installation did't work, please try this (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev

git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build
cd build

#generating native build files (Makefile) for Linux environment with python support and built examples
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_EXAMPLES=ON -DPYTHON2_EXECUTABLE=/usr/bin/python2.7 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python2.7 -DPYTHON_LIBRARY=PYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so -DPYTHON2_NUMPY_INCLUDE_DIR=/usr/lib/python2.7/dist-packages/numpy/core/include/ ..

#building directory
make -j7 # runs 7 jobs in parallel

#installing libraries
sudo make install

fi


