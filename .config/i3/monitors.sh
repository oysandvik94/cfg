#! /usr/bin/bash


INTERNAL_MONITOR="eDP-1"
# Finding the last connected monitor for single monitor setup
EXTERNAL_MONITOR="$(xrandr | grep " connected " | awk '{ print $1 }' | tail -n 1)"
echo "$EXTERNAL_MONITOR" >>~/tmp/bspwm.log

# First time setup
LID_STATUS=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')

# Docked, lid is closed and external monitor is connected
if xrandr -q | grep "${EXTERNAL_MONITOR} connected" && [ "$LID_STATUS" = 'closed' ]; then
	echo "Setting up single monitor setup" >>~/tmp/bspwm.log
	xrandr --output "$INTERNAL_MONITOR" --off
	xrandr --output "$EXTERNAL_MONITOR" --primary --auto

	# This fixes an issue with resolutions where windows dont fill the screen
	# https://github.com/baskerville/bspwm/issues/893#issuecomment-1331689623
elif [ "$EXTERNAL_MONITOR" != $INTERNAL_MONITOR ] && [ "$LID_STATUS" = 'open' ]; then
	echo "Setting up dual monitor setup" >>~/tmp/bspwm.log
	xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --rotate normal
	xrandr --output "$EXTERNAL_MONITOR" --mode 1920x1080 --rotate normal --right-of "$INTERNAL_MONITOR"
else
	xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --rotate normal
fi
