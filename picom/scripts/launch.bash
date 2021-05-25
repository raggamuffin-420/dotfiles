#!/usr/bin/env bash

# Launches picom.

source $SAPLIB_BASH

# Terminate already running bar instances
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch picom
picom --experimental-backends &
