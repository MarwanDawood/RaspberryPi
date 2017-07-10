# Keras Tensorflow installation for Ubuntu 17.04 (Zesty Zapus)

[Install Keras with Tensorlow complete guide](http://www.pyimagesearch.com/2016/11/14/installing-keras-with-tensorflow-backend/)

>path of Keras installation is `~/Envs/keras_tf/`

## running the installation scripts
>at first, modify `CURRENT_USER` environment variable then run the following
```
source install_part_1.sh
source install_part_2.sh
```

>after successful installation, try one of Keras examples
```python ~/Envs/keras_tf/keras/examples/addition_rnn.py```
>if an error occurred, try reinstalling tensorflow again
```pip install --upgrade tensorflow```

## installing tensorflow GPU support in addition to CPU
```
sudo apt-get install libcupti-dev
pip install --upgrade tensorflow-gpu

sudo apt-get install linux-headers-$(uname -r)
sudo dpkg -i Downloads/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
```

## switching between different environments
```
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
workon keras_tf
```

- - - -
>solving failed apt-get update issue
```echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null```

