#!/bin/sh
xsetroot -cursor_name left_ptr
xset s off
xinput set-prop 11 309 1 & # enable touchpad
# setxkbmap us -option caps:none &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap ~/.Xmodmap
# sh ~/.screenlayout/165hz.sh
export ROCKET_TEMPLATE_DIR=~/git/ddg-proxy/templates
~/git/ddg-proxy/ddg-proxy &

dunst &
~/.fehbg &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
