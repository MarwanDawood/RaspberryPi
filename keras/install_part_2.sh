#!/bin/sh

source  ~/Envs/keras_tf/bin/activate
deactivate
source ~/Envs/keras_tf/bin/activate

printf "\ngetting keras repo\n"
git clone git@github.com:fchollet/keras.git

printf "\ninstalling tensorflow to support only CPU\n"
pip install --upgrade tensorflow
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.1-cp27-none-linux_x86_64.whl
pip install --upgrade $TF_BINARY_URL

printf "\nintializing tensorflow for the first timn"
python -c "import tensorflow"

printf "\ninstalling Keras now\n"
pip install numpy scipy scikit-learn pillow h5py keras

printf "\nintializing keras for the first time\n"
python -c "import keras"

#printf "\nshowing keras expected configuration,
#{
#    "image_dim_ordering": "tf", 
#    "epsilon": 1e-07, 
#    "floatx": "float32", 
#    "backend": "tensorflow"
#}"
printf "\nshowing keras actual configuration\n"
cat ~/.keras/keras.json

