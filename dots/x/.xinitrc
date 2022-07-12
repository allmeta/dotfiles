#!/bin/sh
xsetroot -cursor_name left_ptr
xset s off -dpms
# sh ~/.screenlayout/165hz.sh  # in xorg config
ddg-proxy > ~/ddg-log & # /etc/env

dunst &
~/.fehbg &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
