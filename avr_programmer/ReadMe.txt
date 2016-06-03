https://learn.adafruit.com/program-an-avr-or-arduino-using-raspberry-pi-gpio-pins/installation
to install avrdude as a package

copy the file, /etc/avrdude.conf into home directory after renaming it
find the commented out linuxgpio section and add the following

programmer
  id    = "pi_avr_prog";
  desc  = "Use the Linux sysfs interface to bitbang GPIO lines";
  type  = "linuxgpio";
  reset = 12;
  sck   = 24;
  mosi  = 23;
  miso  = 18;
;


If everything is connected and configured properly, you should be able to run this now and get into the avrdude console.

#avrdude -v
#sudo avrdude -p atmega32 -C ~/avrdude_gpio.conf -c pi_avr_prog -v

flash fuses to set up the type and range of the oscillator, so clock work as expected
tables 4, 5, 87, 88 in datasheet
http://treehouseprojects.ca/fusebits/
#sudo avrdude -p atmega32 -C ~/avrdude_gpio.conf -c pi_avr_prog -v -U lfuse:w:0xff:m -U hfuse:w:0xc9:m

to flash code
#sudo avrdude -p atmega32 -C ~/avrdude_gpio.conf -c pi_avr_prog -v -U flash:w:blink.hex

#################################

AVR Timer
http://maxembedded.com/2011/07/avr-timers-ctc-mode/
http://maxembedded.com/2011/06/introduction-to-avr-timers/
Timer calculator
http://eleccelerator.com/avr-timer-calculator/

		Required Delay in ms 
Timer Count = _________________________ - 1
		Clock Time period in ms

so, for a crystal of 4MHz, we get a maximum delay of 16.384 ms! 
thus to overcome this, we use prescalers in TCCR1B register
