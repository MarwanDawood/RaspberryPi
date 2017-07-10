#!/bin/sh
CURRENT_USER=marwan

sudo apt-get update

printf "\ninstalling keras and tensorflow dependencies\n"
sudo apt-get install git-all
sudo apt-get install python-pip python-dev
pip install --no-cache-dir virtualenv
pip install --no-cache-dir virtualenvwrapper

printf "\ncreating a virtual environment\n"
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
sudo cp /home/${CURRENT_USER}/.local/bin/virtualenvwrapper.sh /usr/local/bin/
source /usr/local/bin/virtualenvwrapper.sh 

printf "\nmaking virtual environment for Keras tensorflow\n"
mkvirtualenv keras_tf
workon keras_tf


