## LIRC (Linux Infrared Remote Control)

Refer to this [topic](https://www.instructables.com/Install-and-Configure-Linux-Infrared-Remote-Contro/) for more information.
This device runs on Raspberry-Pi.

1. Intsall LIRC package
`apt-get install lirc liblircclient-dev`

2. Edit `/etc/lirc/hardware.conf` and have it appear exactly as shown below.
```
########################################################
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
########################################################
```
3. Add in `/boot/config.txt` the following line `dtoverlay=lirc-rpi` by running
```
echo "dtoverlay=lirc-rpi" >>/boot/config.txt
```
4. Start the modules up on startup boot and configure the input/output pins
```
echo "lirc_dev" >>/etc/modules
echo "lirc_rpi gpio_in_pin=18 gpio_out_pin=22" >>/etc/modules
```
5. mode2 to get device info
```
mode2 -d /dev/lirc0
```
6. To stop the service
```
/etc/init.d/lirc stop
```
7. restart lirc service
```
/etc/init.d/lirc restart
```