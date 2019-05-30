#!/bin/bash -eu
# gets i, d or t. increase dec and mute.
# plays sound and sends notif

case $1 in
"i")
    $(pamixer -i 10)
    $(paplay ~/.config/i3/tick.wav)
;;
"d")
    $(pamixer -d 10)
    $(paplay ~/.config/i3/tick.wav)
;;
"t")
    $(pamixer -t)
;;
esac