#!/bin/bash

# Detect if multiple monitors are connected or not
a=$(xrandr --listmonitors | head -n 1 | awk '{print $2}')

if [[ $a > 1 ]];
then
	echo "Monitor connected"
	#xrandr --output HDMI-1 --auto --left-of eDP-1
else
	echo "Single monitor"
	#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --off
fi


