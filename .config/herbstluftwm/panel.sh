#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar on each monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "HDMI-1" ]; then
      MONITOR=$m polybar --reload mainbar-herbstluftwm-extra &
    else
      MONITOR=$m polybar --reload mainbar-herbstluftwm &
    fi
  done
else
  polybar --reload mainbar-herbstluftwm &
  polybar --reload mainbar-herbstluftwm-extra &
fi

echo "Bars launched..."
