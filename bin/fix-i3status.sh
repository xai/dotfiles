#!/bin/bash

config="$HOME/.config/i3status/config"
thermalzone="$(grep -l x86_pkg_temp /sys/class/thermal/thermal_zone*/type | head -n1)"

if [ -z "$thermalzone" ]; then
	echo "No thermal zone found"
	exit 1
fi

thermalzone="$(dirname $thermalzone)/temp"
if ! grep -q "path  = $thermalzone" $config; then
	echo "Updating i3status config to use thermalzone $thermalzone ..."
	sed -i "s^path = /sys/class/thermal/thermal_zone.*^path = $thermalzone^" $config
fi

