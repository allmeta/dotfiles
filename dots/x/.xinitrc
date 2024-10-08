#!/bin/sh
xrdb -merge ~/.cache/wal/colors.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
xsetroot -cursor_name left_ptr
xset s off -dpms
xset r rate 300 30
# sh ~/.screenlayout/165hz.sh  # in xorg config
ddg-proxy > ~/.ddg-log & # see /etc/environment
export XDG_SESSION_TYPE=x11

dunst &
~/.fehbg &
exec ${1:-i3}
