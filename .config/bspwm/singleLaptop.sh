#!/bin/bash

INTERNAL_MONITOR="eDP-1"
sleep 1
xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --rotate normal
bspc monitor "$INTERNAL_MONITOR" -d chat term web music code notes 
bspc wm -O "$INTERNAL_MONITOR"

