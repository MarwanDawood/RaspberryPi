#!/bin/bash

avr-gcc -g -Os -mmcu=atmega32 -c blink.c
avr-gcc -g -mmcu=atmega32 -o blink.elf blink.o
avr-objcopy -j .text -j .data -O ihex blink.elf blink.hex
