#!/bin/bash

while true; do
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$BAT" -lt 20 ] && [ "$STATUS" = "Discharging" ]; then
        notify-send -u critical "Battery Low" "Battery is at ${BAT}%"
    fi

    sleep 120
done
