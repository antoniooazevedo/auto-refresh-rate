#! /bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/antonio/.Xauthority

DISPLAY=eDP
CURR_RR=120

xrandr -display :0.0 --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr -display :0.0 --addmode eDP "1920x1200_60.00"

while true
do
	if [ $(cat /sys/class/power_supply/AC0/online) -eq 0 ]
	then
		if [ $CURR_RR -ne 60 ]
		then
			xrandr -display :0.0 --output $DISPLAY --mode "1920x1200_60.00" --primary
			CURR_RR=60
		fi
	else
		if [ $CURR_RR -ne 120 ]
		then
			xrandr -display :0.0 --output $DISPLAY --mode 1920x1200 -r 120 --primary
			CURR_RR=120
		fi
	fi
	
	sleep 2
done
	
