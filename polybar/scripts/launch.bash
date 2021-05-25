#!/usr/bin/env bash

# Launches polybar.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
bars=(main_top main_bottom)
for bar in "${bars[@]}"
do
    polybar "$bar" 1>/dev/null 2>/dev/null &
    ln -s /tmp/polybar_mqueue.$! /tmp/ipc-"$bar"
done
