## AVR Timer
The timer in AVR can be calculated as below (in milliseconds):
**Timer_Count = (Required_Delay_in / Clock_Time_period) - 1**
[Online timer calculator](http://eleccelerator.com/avr-timer-calculator/)

Therefore for a crystal of 4MHz, we get only a maximum delay of 16.384 ms! Thus to overcome this, we use prescalers in TCCR1B register.

More references
http://maxembedded.com/2011/07/avr-timers-ctc-mode/\
http://maxembedded.com/2011/06/introduction-to-avr-timers/

## install avrdude as a package
This is based on this [topic](https://learn.adafruit.com/program-an-avr-or-arduino-using-raspberry-pi-gpio-pins/installation).
This burner shall run on Raspberry-Pi which is connected

1. Build the demo example `blink.c` using the command `./build.sh`
2. In the file `avrdude.conf` in current directory, find out the commented code in linuxgpio section (line 1313) and replace it with the following
```
programmer
  id    = "pi_avr_prog";
  desc  = "Use the Linux sysfs interface to bitbang GPIO lines";
  type  = "linuxgpio";
  reset = 12;
  sck   = 24;
  mosi  = 23;
  miso  = 18;
;
```
3. If everything is connected and configured properly, you should be able to run this now  and get into the avrdude console.
```
/tmp/avrdude-6.1/avrdude -v
sudo /tmp/avrdude-6.1/avrdude -p atmega32 -C avrdude_gpio.conf -c pi_avr_prog -v
```
4. The AVR AtmegaXXX microcontrollers comes with a default 1 MHz internal oscillator. Flash fuses to set up the type and range of the oscillator, so clock work as expected. This [online calculator](https://eleccelerator.com/fusecalc/fusecalc.php?chip=atmega32&LOW=FF&HIGH=C9&LOCKBIT=FF) shows the used configuration. This can be seen also in the [datasheet](doc2503.pdf) in tables 9, 104 and 105. CKOPT register is unprogrammed by default, the Calibrated Internal RC Oscillator at 4MHz can be used by setting low fuse to 0xFC (not tested). The Format of the Device Identification Register can be seen in tables 87 and 88. Boot size 256 words as in table 99.
```
sudo /tmp/avrdude-6.1/avrdude -p atmega32 -C avrdude_gpio.conf -c pi_avr_prog -v -U lfuse:w:~~0xff~~0xfc:m -U hfuse:w:0xc9:m
```
5. Flash binary file
```
sudo /tmp/avrdude-6.1/avrdude -p atmega32 -C avrdude_gpio.conf -c pi_avr_prog -v -U flash:w:blink.hex
```