#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log 
#polybar mybar 2>&1 | tee -a /tmp/polybar1.log & disown
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar &
  done
else
  polybar --reload mybar &
fi

echo "Bars launched..."
