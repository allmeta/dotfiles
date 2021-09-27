#!/bin/sh
xinput set-prop 11 309 1 & # enable touchpad
# setxkbmap us -option caps:none &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap ~/.Xmodmap
export ROCKET_TEMPLATE_DIR=/home/meta/git/ddg-proxy/templates
/home/meta/git/ddg-proxy/ddg-proxy &

dunst &
~/.fehbg &
start-pulseaudio-x11 &
picom -b --experimental-backends --vsync --dbus
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
