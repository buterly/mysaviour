#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
dir="$HOME/.config/polybar"
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo launch polybar

# Launch bar1 and bar2
#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

#polybar bar1 &
polybar -r -q top & 
polybar -r -q bottom &

echo "Bars launched..."
