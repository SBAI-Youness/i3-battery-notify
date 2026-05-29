#!/bin/bash

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$STATUS" != "Charging" && "$CAPACITY" -lt 20 ]]; then
  notify-send --urgency=critical "Low Battery" "Battery is at ${CAPACITY}%"
fi
