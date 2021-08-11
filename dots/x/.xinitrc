#!/bin/sh
xinput set-prop 11 309 1 & # enable touchpad
setxkbmap us -option ctrl:nocaps &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap -e "keycode 135 = Super_L" &
export ROCKET_TEMPLATE_DIR=/home/meta/git/ddg-proxy/templates
/home/meta/git/ddg-proxy/ddg-proxy &

dunst &
~/.fehbg &
pulseaudio &
picom -b &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
