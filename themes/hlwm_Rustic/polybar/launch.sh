#!/bin/bash

launch() {
 for b in ${BAR_NAMES[@]}; do
  echo $b
  MONITOR=$1 polybar --reload -c $BAR_CONFIG $b &
 done
}

# Terminate already running bar instances
killall -q polybar

BAR_NAMES=(left middle right)
BAR_CONFIG=~/.config/polybar/config.ini

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch on primary monitor

sleep 1
launch $PRIMARY

# Launch on all other monitors
for m in $OTHERS; do
 launch $m
done
