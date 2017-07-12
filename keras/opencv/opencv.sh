#!/bin/sh

read -p "install using apt-get, try this at first time please (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
apt-get update
apt-get upgrade
apt-get install python2.7-dev python-numpy python-opencv libopencv-dev python-matplotlib
fi

read -p "if the previous installation did't work, please try this (y/n)?" choice
if  [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
apt-get install build-essential
apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev

#git clone git@github.com:opencv/opencv.git
#git clone git@github.com:opencv/opencv_contrib.git

cd ~/Desktop/opencv
mkdir build
cd build

#generating native build files (Makefile) for Linux environment with python support and built examples
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_EXAMPLES=ON \
      -DBUILD_OPENCV_PYTHON=ON \
      -DPYTHON2_EXECUTABLE=/usr/bin/python2.7 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
      -DPYTHON_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python2.7 \
      -DPYTHON_LIBRARY=PYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so \
      -DPYTHON2_NUMPY_INCLUDE_DIR=/usr/lib/python2.7/dist-packages/numpy/core/include/ ..

#building directory
make -j7 # runs 7 jobs in parallel

#installing libraries
make install

ldconfig  
echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >> /etc/bash.bashrc
echo "export PKG_CONFIG_PATH" >> /etc/bash.bashrc

ln -s /usr/lib/python2.7/dist-packages/cv2.x86_64-linux-gnu.so ~/Envs/keras_tf/lib/python2.7/site-packages/cv2.so

fi


