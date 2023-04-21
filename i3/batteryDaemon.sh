#!/bin/bash
battery=$(acpi -V | head -1 | awk '{print $4}' | cut -c 1-2)

if [[ $(($battery<=5)) == 1 ]]; then
	/usr/local/bin/dunstify "Battery Level below 5%: Please connect charger"
elif [[ $(($battery<=10)) == 1 ]]; then
	/usr/local/bin/dunstify "Battery Level below 10%: Please connect charger"
elif [[ $(($battery<=20)) == 1 ]]; then
	/usr/local/bin/dunstify "Battery Level below 20%: Please connect charger"
elif [[ 1 ]]; then
	echo "Battery Level Fine"
fi

# Add to crontab conf
#SHELL=/bin/bash 
#PATH=/bin:/sbin:/usr/bin:/usr/sbin
#DISPLAY=:0 
#DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" 
# m h  dom mon dow   command
# * * * * * bash /home/shivkar2n/.config/i3/batteryDaemon.sh
