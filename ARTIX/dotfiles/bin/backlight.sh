#!/usr/bin/env bash

DEVICE=$(ls /sys/class/backlight)




echo $1 | sudo tee /sys/class/backlight/$DEVICE/brightness
