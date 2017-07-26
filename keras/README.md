This project ran on PyCharm IDE with keras interpreter extension to support auto complete

# Switching between different environments
```
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
workon open_cv_3
```
# Creating a new environment
```
export WORKON_HOME=~/Envs
source /home/marwan/.local/bin/virtualenvwrapper.sh 
mkvirtualenv open_cv_3
workon open_cv_3
```
- - -

# Keras Tensorflow installation for Ubuntu 17.04 (Zesty Zapus)

[Install Keras with Tensorflow complete guide](http://www.pyimagesearch.com/2016/11/14/installing-keras-with-tensorflow-backend/)

path of Keras installation is `~/Envs/keras_tf/`

## Running Keras installation scripts for CPU only with virtual environment
modify first `CURRENT_USER` environment variable then run the following
```
source keras_install_part_1.sh
source keras_install_part_2.sh
```

>after successful installation, try one of Keras examples like `python ~/Envs/keras_tf/keras/examples/addition_rnn.py`, if an error occurred, then try reinstalling tensorflow again through the command `pip install --upgrade tensorflow`

## Running OpenCV installation scripts
```
source opencv_3.5_install.sh
```

## Installing tensorflow GPU support in addition to CPU
```
sudo apt-get install libcupti-dev
pip install --upgrade tensorflow-gpu

sudo apt-get install linux-headers-$(uname -r)
sudo dpkg -i Downloads/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
```

- - - -

# Common pitfalls
>solving failed `apt-get update` issue
```
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
```
>resizing swap file
```
#Make all swap off
sudo swapoff -a

#Resize the swapfile
sudo dd if=/dev/zero of=/swapfile bs=9M count=1024

#Make swapfile usable
sudo mkswap /swapfile

#Make swapon again
sudo swapon /swapfile
```
