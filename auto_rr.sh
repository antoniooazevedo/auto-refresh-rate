#! /bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/antonio/.Xauthority

CURR_RR=120.00

xhost +local:

xrandr -display :0.0 --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr -display :0.0 --addmode eDP "1920x1200_60.00"

getRefreshRate() {
	xrandr | grep '*' | awk '{print $2}' | sed 's/[^0-9.]//g'
}

while true
do
	if [ $(cat /sys/class/power_supply/AC0/online) -eq 0 ]
	then
		if [ "$(echo "$CURR_RR != 59.88" | bc)" -eq 1 ]
		then
			xrandr -display :0.0 --output eDP --mode "1920x1200_60.00" --primary
		fi
	else
		if [ "$(echo "$CURR_RR != 120.00" | bc)" -eq 1 ]
		then
			xrandr -display :0.0 --output eDP --mode 1920x1200 -r 120 --primary
		fi
	fi
	CURR_RR=$(getRefreshRate)
	
	sleep 2
done
