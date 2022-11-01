#!/usr/bin/env sh

# Terminate already running bar instances
killall -q -9 polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# ENV
export WLAN="wlp7s0"
export TRAY_POS="right"

# Launch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    export MONITOR=$m
    polybar -c ~/.config/polybar/config ${1:-i3} 2>~/.polybar-log &
    export -n TRAY_POS # remove TRAY_POS after first monitor, so the tray doesnt conflict on multi monitor
  done
else
  polybar -c ~/.config/polybar/config ${1:-i3} 2>~/.polybar-log &
fi
