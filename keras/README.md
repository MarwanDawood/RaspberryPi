>http://www.pyimagesearch.com/2016/11/14/installing-keras-with-tensorflow-backend/
>https://virtualenvwrapper.readthedocs.io/en/latest/

#to solve failed apt-get update issue
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

#to run the installation scripts,
```
source install_part_1.sh
```

>switching between different environments
```
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
workon keras_tf
```


>installing tensorflow GPU support in addition to CPU
```
sudo apt-get install libcupti-dev
pip install --upgrade tensorflow-gpu

sudo apt-get install linux-headers-$(uname -r)
sudo dpkg -i Downloads/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
```
